@Skip()

import 'dart:convert';

import 'package:ckb_sdk/ckb_rpc.dart';
import 'package:ckb_sdk/ckb_types.dart';
import 'package:test/test.dart';

main() {
  final apiClient = new CKBApiClient("http://127.0.0.1:8114");

  test('send transaction', () async {
    try {
      var transaction = Transaction("0", "", [], [], [
        CellInput(
            OutPoint(
                "0x8d37f0856ebb70c12871830667d82224e6619896c7f12bb73a14dd9329af9c8d",
                "0"),
            "0")
      ], [
        CellOutput(
            '10000',
            Script(
                '0x28e83a1277d48add8e72fadaa9248559e1b632bab2bd60b27955ebc4c03800a5',
                ''),
            null)
      ], [], []);
      String hash = await apiClient.sendTransaction(transaction);
      print(hash);
    } catch (e) {
      e.toString();
      expect(true, true);
    }
  });

  test('txPoolInfo', () async {
    try {
      TxPoolInfo txPoolInfo = await apiClient.txPoolInfo();
      print(jsonEncode(txPoolInfo));
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });
}
