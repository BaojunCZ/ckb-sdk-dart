import 'dart:typed_data';

import 'package:ckb_sdk/ckb_types.dart';
import 'package:convert/convert.dart';
import 'package:test/test.dart';

main() {
  test('signTx', () {
    CellInput cellInput = CellInput(null, "");
    Witness witness1 = Witness(['123']);
    Witness witness2 = Witness(['456']);
    Witness witness3 = Witness(['789']);
    Uint8List privateKey =
        hex.decode("e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3");
    Transaction transaction = Transaction(
        "1", "", [], [cellInput, cellInput, cellInput], [], [witness1, witness2, witness3]);
    transaction.signTx([privateKey, privateKey, privateKey],
        'e4253550e49e1a78c8ae9e9e7f66506e11ce87d102fd1aad5dad04c88eca2bb2');
    expect(transaction.witnesses.length, 3);
    expect(transaction.witnesses[0].data[0],
        "0x024a501efd328e062c8675f2365970728c859c592beeefd6be8ead3d901330bc01");
    expect(transaction.witnesses[0].data[1],
        '0x304402207d29d0b659bc6c7cd6545938b93e11910abfa1864c52588934876dfa3dd3bb570220067e61b89989525c3551530a4c17bb5e76c7723ab6690bd5c492bd39cb4b35f9');
    expect(transaction.witnesses[0].data[2], '123');
    expect(transaction.witnesses[1].data[2], '456');
  });
}
