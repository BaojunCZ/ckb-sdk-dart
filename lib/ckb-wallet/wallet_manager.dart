import 'dart:math';
import 'dart:io';
import 'credential.dart';
import '../ckb-utils/number.dart' as number;
import '../ckb-rpc/api_client.dart';
import '../ckb-types/item/cell_input.dart';
import './wallet_constant.dart';

class WalletManager {
  final ApiClient _apiClient;
  final Credential _credential;

  static final _MRUBY_CELL_HASH =
      "0x2165b10c4f6c55302158a17049b9dad4fef0acaf1065c63c02ddeccbce97ac47";
  static final _MRUBY_OUT_POINT_HASH =
      "0xff50745e53c9af867763834dda3a94fbe833e9318ddb3570a2e914630fcaea17";

  const WalletManager._(this._apiClient, this._credential);

  static WalletManager init(ApiClient _apiClient, Credential _credential) {
    return new WalletManager._(_apiClient, _credential);
  }

  getAddress() {
    Unlock unlock = unlockScript();
    return unlock.getTypeHash();
  }

  Future<List<Cell>> getUnspentCells(String address) async {
    print(address);
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

  Unlock unlockScript() {
    File file = File('res/bitcoin_unlock.rb');
    List<String> verifyScript_lines = file.readAsLinesSync();
    String verifyScript = "";
    verifyScript_lines.forEach((line) {
      verifyScript += (line + "\n");
    });
    List<String> signedArgs = [];
    signedArgs.add(verifyScript);
    signedArgs.add(number.toHex(_credential.publicKey, forcePadLen: 66));
    return Unlock(
      VERSION,
      "",
      signedArgs,
      [],
      null,
    );
  }
}
