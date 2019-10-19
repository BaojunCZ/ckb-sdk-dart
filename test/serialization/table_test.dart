import 'dart:typed_data';

import 'package:ckb_sdk/ckb_sdk.dart';
import 'package:test/test.dart';
import 'package:ckb_sdk/ckb_serialization.dart';

main() {
  test('to bytes', () {
    List<Type> lock = List<Type>();
    lock.add(new Byte32(
        string:
            "68d5438ac952d2f584abf879527946a537e82c7f3c1cbf6d8ebf9767437d8e88"));
    lock.add(new Byte1(string: "01"));
    List<Bytes> argList = List<Bytes>();
    argList.add(new Bytes(string: "3954acece65096bfa81258983ddb83915fc56bd8"));
    lock.add(new Dynamic(argList));
    Table table = Table(lock);
    Uint8List result = table.toBytes();
    expect(
        result,
        hexStringToByteArray(
            "5100000010000000300000003100000068d5438ac952d2f584abf879527946a537e82c7f3c1cbf6d8ebf9767437d8e88012000000008000000140000003954acece65096bfa81258983ddb83915fc56bd8"));
  });
}
