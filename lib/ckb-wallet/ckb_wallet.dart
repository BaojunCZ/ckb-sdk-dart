import 'package:ckb_dart_sdk/ckb-rpc/api_client.dart';
import 'package:ckb_dart_sdk/ckb-wallet/wallet_utils.dart' as utils;
import 'package:ckb_dart_sdk/ckb-wallet/wallet_constant.dart' as constant;
import 'package:ckb_dart_sdk/ckb-wallet/credential.dart';
import 'dart:math';
import 'package:ckb_dart_sdk/ckb-utils/sign_utils.dart' as sign;
import 'package:ckb_dart_sdk/ckb-utils/TransactionUtils.dart';
import 'dart:convert';

export 'package:ckb_dart_sdk/ckb-wallet/credential.dart';

class CkbWallet {
  Credential _credential;
  ApiClient _apiClient;

  String _MRUBY_OUT_POINT_HASH = "";

  CkbWallet(ApiClient apiClient, Credential credential) {
    _credential = credential;
    _apiClient = apiClient;
  }

  Credential getCredential() {
    return _credential;
  }

  setCredential(Credential credential) {
    _credential = credential;
  }

  setMRUBY_OUT_POINT_HASH(String mRubyOutPointHash) {
    _MRUBY_OUT_POINT_HASH = mRubyOutPointHash;
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
    print(jsonEncode(tx));
    String hash = await _apiClient.sendTransaction(tx);
    return hash;
  }

  Future<Transaction> generateTx(
      Unlock unlock, String toAddress, int capacity) async {
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
    var outpoints = [OutPoint(_MRUBY_OUT_POINT_HASH, 0)];
    return Transaction(
        outpoints,
        "",
        sign.signSigHashAllInputs(
            validInputs.inputs, outputs, _credential.privateKey),
        outputs,
        constant.VERSION);
  }
}
