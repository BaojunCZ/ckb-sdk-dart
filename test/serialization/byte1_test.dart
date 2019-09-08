import 'dart:typed_data';

import 'package:ckb_sdk/ckb_serialization.dart';
import 'package:test/test.dart';

main() {
  test('init empty', () {
    try {
      Uint8List list = Uint8List.fromList([]);
      Byte1 byte1 = new Byte1(bytes: list);
      byte1.toBytes();
    } catch (error) {
      expect(true, error is UnsupportedError);
    }
  });

  test('init two byte', () {
    try {
      Uint8List list = Uint8List.fromList([0x01, 0x02]);
      Byte1 byte1 = new Byte1(bytes: list);
      byte1.toBytes();
    } catch (error) {
      expect(true, error is UnsupportedError);
    }
  });

  test('init right', () {
    Uint8List list = Uint8List.fromList([0x01]);

    Byte1 byte1 = new Byte1(string: "1");
    Byte1 byte2 = new Byte1(string: "01");

    expect(byte1.toBytes(), list);
    expect(byte2.toBytes(), list);
  });
}
