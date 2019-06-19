import 'dart:convert';

import 'package:ckb_sdk/ckb_rpc.dart';
import 'package:ckb_sdk/ckb_types.dart';
import 'package:test/test.dart';

main() {
  final apiClient = new CKBApiClient("http://127.0.0.1:8114");
  test('get lives cells by lock hash', () async {
    List<CellWithCreate> cells = await apiClient.getLiveCellsByLockHash(
        "0xe94e4b509d5946c54ea9bc7500af12fd35eebe0d47a6b3e502127f94d34997ac", "0", "3");
    print(jsonEncode(cells));
  });

  test('get lock hash index states', () async {
    List<LockHashIndexStates> list = await apiClient.getLockHashIndexStates();
    print(jsonEncode(list));
  });

  test('get transactions by lock hash', () async {
    List<TransactionByLockHash> list = await apiClient.getTransactionByLockHash(
        "0xe94e4b509d5946c54ea9bc7500af12fd35eebe0d47a6b3e502127f94d34997ac", "0", "3");
    print(jsonEncode(list));
  });
}
