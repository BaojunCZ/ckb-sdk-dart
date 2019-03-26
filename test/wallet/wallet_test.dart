import 'dart:convert';

import 'package:test/test.dart';
import 'package:ckb_sdk/ckb_sdk.dart';

void main() async {
  Credential credential = Credential.fromPrivateKeyHex(
      "e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3");
  CkbWallet wallet = CkbWallet(credential);

  test('get address', () {
    try {
      Unlock unlock = wallet.getCredential().getUnlockScript(
          'res/bitcoin_unlock.rb',
          reference:
              "0x2175f028e470cb26f0c40cfcf3cb4b602a24719798ed5feca4db867f1d847d4a");
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
