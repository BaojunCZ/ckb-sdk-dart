import 'dart:typed_data';

import 'package:ckb_sdk/ckb_sdk.dart';
import 'package:ckb_sdk/ckb_serialization.dart';
import 'package:test/test.dart';

main() {
  test('to bytes', () {
    Uint64 uint64 = new Uint64(intValue: BigInt.from(25689834934789));
    Uint8List bytes = uint64.toBytes();
    expect(bytes.length, 8);
    expect(bytesToHex(bytes, forcePadLen: 16), "05527c615d170000");
  });
}
