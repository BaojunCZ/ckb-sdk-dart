import 'dart:convert';
import 'package:test/test.dart';
import 'package:ckb_dart_sdk/ckb-wallet/ckb_wallet.dart';
import 'package:ckb_dart_sdk/ckb-wallet/credential.dart';
import 'package:ckb_dart_sdk/ckb-rpc/api_client.dart';

void main() async {
  Credential credential = Credential.fromPrivateKeyHex(
      "e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3");
  CkbWallet wallet =
      CkbWallet(ApiClient("http://192.168.2.203:8114/"), credential);

  test('get address', () {
    try {
      Unlock unlock = wallet.getCredential().getUnlockScript(
          'res/bitcoin_unlock.rb',
          reference:
              "0x2165b10c4f6c55302158a17049b9dad4fef0acaf1065c63c02ddeccbce97ac47");
      print(jsonEncode(unlock));
      String address = wallet.getCredential().getAddress(unlock);
      print(address);
    } catch (error) {
      print(error);
      print(jsonEncode(error));
    }
  });

  test("get unspentcells", () async {
    try {
      String address = wallet.getCredential().getAddress(
          wallet.getCredential().getUnlockScript('res/bitcoin_unlock.rb'));
      List<Cell> cells = await wallet.getUnspentCells(address);
      print(jsonEncode(cells));
    } catch (error) {
      print(jsonEncode(error));
    }
  });

  test("get balance", () async {
    try {
//      String address =
//          wallet.getCredential().getAddress(wallet.getCredential().getUnlockScript('res/bitcoin_unlock.rb'));
      int balance = await wallet.getBalance(
          "0x0da2fe99fe549e082d4ed483c2e968a89ea8d11aabf5d79e5cbf06522de6e674");
      print(balance);
    } catch (error) {
      print(jsonEncode(error));
    }
  });

  test("get transaction", () async {
    try {
      Unlock unlock = credential.getUnlockScript('res/bitcoin_unlock.rb');
      Transaction trasaction =
          await wallet.generateTx(unlock, credential.getAddress(unlock), 1000);
      print(jsonEncode(trasaction));
    } catch (error) {
      print(jsonEncode(error));
    }
  });
}
