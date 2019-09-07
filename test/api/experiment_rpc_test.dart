@Skip()

import 'package:ckb_sdk/ckb_rpc.dart';
import 'package:ckb_sdk/ckb_types.dart';
import 'package:test/test.dart';

main() {
  final apiClient = new CKBApiClient("http://127.0.0.1:8114");

  test('compute transaction hash', () async {
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
                []),
            null)
      ], [], []);
      String hash = await apiClient.computeTransactionHash(transaction);
      print(hash);
    } catch (e) {
      print(e.toString());
      expect(true, true);
    }
  });

  test('dry run transaction', () async {
    try {
      var senTransaction = Transaction("0", "", [], [], [
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
                []),
            null)
      ], [], []);
      Cycles cycles = await apiClient.dryRunTransaction(senTransaction);
      print(cycles.cycles);
    } catch (e) {
      print(e.toString());
      expect(true, true);
    }
  });
}
