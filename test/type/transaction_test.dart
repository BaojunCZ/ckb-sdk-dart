@Skip()

import 'dart:typed_data';

import 'package:ckb_sdk/ckb_types.dart';
import 'package:convert/convert.dart';
import 'package:test/test.dart';

main() {
  test('signTx', () {
    CellInput cellInput = CellInput(null, "");
    String witness1 = "";
    String witness2 = "456";
    String witness3 = "789";
    Uint8List privateKey = hex.decode(
        "e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3");
    Transaction transaction = Transaction(
        "1",
        "",
        [],
        [],
        [cellInput, cellInput, cellInput],
        [],
        [],
        [witness1, witness2, witness3]);
    transaction.signTx([privateKey, privateKey, privateKey]);
    expect(transaction.witnesses.length, 3);
    expect(transaction.witnesses[0],
        '0x2c643579e47045be050d3842ed9270151af8885e33954bddad0e53e81d1c2dbe2dc637877a8302110846ebc6a16d9148c106e25f945063ad1c4d4db2b695240800');
    expect(transaction.witnesses[2], '789');
    expect(transaction.witnesses[1], '456');
  });
}
