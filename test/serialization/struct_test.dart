import 'dart:core';

import 'package:ckb_sdk/ckb_crypto.dart';
import 'package:ckb_sdk/ckb_serialization.dart';
import 'package:test/test.dart';

main() {
  test('to bytes', () {
    Byte1 byte1 = new Byte1(string: "ab");
    Byte32 byte32 = new Byte32(
        string:
            "0102030405060708090001020304050607080900010203040506070809000102");
    List<Type> args = new List();
    args.add(byte1);
    args.add(byte32);

    Struct struct = new Struct(args);
    expect(
        struct.toBytes(),
        hexStringToByteArray(
            "0xab0102030405060708090001020304050607080900010203040506070809000102"));
  });
}
