import 'dart:typed_data';

import 'package:ckb_sdk/ckb_crypto.dart';
import 'package:ckb_sdk/ckb_serialization.dart';
import 'package:test/test.dart';

main() {
  test('init empty', () {
    try {
      Uint8List list = Uint8List.fromList([]);
      Byte32 byte32 = new Byte32(bytes: list);
      byte32.toBytes();
    } catch (error) {
      expect(true, error is UnsupportedError);
    }
  });

  test('init wrong', () {
    try {
      Uint8List list = Uint8List.fromList([0x01, 0x02, 0x02, 0x03]);
      Byte32 byte32 = new Byte32(bytes: list);
      byte32.toBytes();
    } catch (error) {
      expect(true, error is UnsupportedError);
    }
  });

  group("init right", () {
    test('0x01', () {
      Uint8List list = Uint8List.fromList([
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
        0x01,
      ]);
      Byte32 byte32 = new Byte32(bytes: list);
      expect(byte32.toBytes(), list);
    });

    test('string', () {
      String test =
          "68d5438ac952d2f584abf879527946a537e82c7f3c1cbf6d8ebf9767437d8e88";
      Byte32 byte32 = new Byte32(string: test);
      Uint8List bytes = hexStringToByteArray(test);
      expect(byte32.toBytes(), bytes);
    });
  });
}
