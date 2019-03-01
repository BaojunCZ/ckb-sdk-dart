import 'package:ckb_dart_sdk/ckb-rpc/api_client.dart';
import 'package:ckb_dart_sdk/ckb-wallet/wallet_utils.dart' as utils;
import 'package:ckb_dart_sdk/ckb-wallet/wallet_constant.dart' as constant;
import 'dart:math';
import 'package:ckb_dart_sdk/ckb-utils/number.dart' as number;
import 'package:ckb_dart_sdk/ckb-utils/TransactionUtils.dart';

class AlwaysSuccessWallet {
  ApiClient _apiClient;

  AlwaysSuccessWallet( {String nodeUrl = 'http://192.168.2.203:8114/'}) {
    _apiClient = ApiClient(nodeUrl: nodeUrl);
  }

  Future<String> getAddress() async {
    Unlock unlock = await getUnlockScript();
    return unlock.getTypeHash();
  }

  Future<Unlock> getUnlockScript() async {
    String reference = await _apiClient.alwaysSuccessCellHash();
    reference = number.hexAdd0x(reference);
    return Unlock(
      constant.VERSION,
      reference,
      [],
      [],
      null,
    );
  }

  Future<List<Cell>> getUnspentCells(String address) async {
    List<Cell> results = [];
    int toBlockNo = await _apiClient.getTipBlockNumber();
    int fromBlockNo = 1;
    while (fromBlockNo <= toBlockNo) {
      int currentToBlockNumber = min(fromBlockNo + 100, toBlockNo);
      List<Cell> cells = await _apiClient.getCellsByTypeHash(
          address, fromBlockNo, currentToBlockNumber);
      if (!cells.isEmpty) {
        results.addAll(cells);
      }
      fromBlockNo = currentToBlockNumber + 1;
    }
    return results;
  }

  Future<int> getBalance(String address) async {
    List<Cell> unspentCells = await getUnspentCells(address);
    int balance = 0;
    unspentCells.forEach((cell) {
      balance += cell.capacity;
    });
    return balance;
  }

  Future<String> sendCapacity(
      Unlock unlock, String toAddress, int capacity) async {
    Transaction tx = await generateTx(unlock, toAddress, capacity);
    tx = formatTx(tx);
    String hash = await _apiClient.sendTransaction(tx);
    return hash;
  }

  generateTx(Unlock unlock, String toAddress, int capacity) async {
    String address = unlock.getTypeHash();
    unlock.typeHash = address;
    utils.ValidInputs validInputs = utils.gatherInputs(
        await getUnspentCells(address),
        capacity,
        constant.MIN_CELL_CAPACITY,
        unlock);
    List<CellOutput> outputs = [];
    outputs.add(CellOutput(capacity, "", toAddress, null));
    outputs.add(CellOutput(validInputs.capacity - capacity, "", address, null));
    OutPoint outpoints = await _apiClient.alwaysSuccessScriptOutPoint();
    return Transaction(
        [outpoints], null, validInputs.inputs, outputs, constant.VERSION);
  }
}
