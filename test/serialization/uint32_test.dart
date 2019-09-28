import 'dart:typed_data';

import 'package:ckb_sdk/ckb_sdk.dart';
import 'package:ckb_sdk/ckb_serialization.dart';
import 'package:test/test.dart';

main() {
  test('to bytes', () {
    Uint32 uint32 = new Uint32(intValue: 256);
    Uint8List bytes = uint32.toBytes();
    expect(bytes.length, 4);
    expect(bytesToHex(uint32.toBytes(), forcePadLen: 8), "00010000");
  });
}
