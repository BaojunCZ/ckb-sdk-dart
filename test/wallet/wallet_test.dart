import '../../lib/ckb-wallet/ckb_wallet.dart';
import '../../lib/ckb-rpc/api_client.dart';
import '../../lib/ckb-wallet/credential.dart';
import 'dart:convert';
import 'package:test/test.dart';

void main() async {
  CkbWallet wallet = CkbWallet(
      ApiClient("http://192.168.0.105:8114/"),
      Credential.fromPrivateKeyHex(
          "e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3"));
  test('get address', () {
    try {
      String address = wallet.getCredential().getAddress(
          wallet.getCredential().getUnlockScript('res/bitcoin_unlock.rb'));
      print(address);
    } catch (error) {
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
      String address = wallet.getCredential().getAddress(
          wallet.getCredential().getUnlockScript('res/bitcoin_unlock.rb'));
      int balance = await wallet.getBalance(address);
      print(balance);
    } catch (error) {
      print(jsonEncode(error));
    }
  });
}
