import 'dart:convert';

import 'package:ckb_sdk/ckb_rpc.dart';
import 'package:ckb_sdk/ckb_types.dart';
import 'package:test/test.dart';

main() {
  final apiClient = new CKBApiClient("http://127.0.0.1:8114");

  test('deindex lock hash', () async {
    try {
      await apiClient.DeindexLockHash(
          "0xe94e4b509d5946c54ea9bc7500af12fd35eebe0d47a6b3e502127f94d34997ac");
      expect(true, true);
    } catch (e) {
      expect(false, true);
    }
  });

  test('get lives cells by lock hash', () async {
    try {
      List<LiveCell> cells = await apiClient.getLiveCellsByLockHash(
          "0xe94e4b509d5946c54ea9bc7500af12fd35eebe0d47a6b3e502127f94d34997ac", "0", "3");
      print(jsonEncode(cells));
    } catch (e) {
      print(e.toString());
    }
  });

  test('get lock hash index states', () async {
    try {
      List<LockHashIndexState> list = await apiClient.getLockHashIndexStates();
      print(jsonEncode(list));
    } catch (e) {
      print(e.toString());
    }
  });

  test('get transactions by lock hash', () async {
    try {
      List<TransactionByLockHash> list = await apiClient.getTransactionByLockHash(
          "0xe94e4b509d5946c54ea9bc7500af12fd35eebe0d47a6b3e502127f94d34997ac", "0", "3");
      print(jsonEncode(list));
    } catch (e) {
      print(e.toString());
    }
  });

  test('get index lock hash', () async {
    try {
      LockHashIndexState lockHashIndexStates = await apiClient.getIndexLockHash(
          "0xe94e4b509d5946c54ea9bc7500af12fd35eebe0d47a6b3e502127f94d34997ac", "1024");
      print(jsonEncode(lockHashIndexStates));
    } catch (e) {
      print(e.toString());
    }
  });
}
