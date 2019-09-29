import 'dart:typed_data';

import 'package:ckb_sdk/ckb_crypto.dart';
import 'package:test/test.dart';
import 'package:ckb_sdk/ckb_serialization.dart';

main() {
  test('to bytes', () {
    List<Type> lock = List<Type>();
    lock.add(new Byte32(
        string:
            "0x68d5438ac952d2f584abf879527946a537e82c7f3c1cbf6d8ebf9767437d8e88"));
    lock.add(new Byte1(string: "01"));
    List<Bytes> argList = List<Bytes>();
    argList
        .add(new Bytes(string: "0xb2e61ff569acf041b3c2c17724e2379c581eeac3"));
    lock.add(new Dynamic(argList));
    Table script = new Table(lock);
    Table cellOutput = new Table(
        [new Uint64(intValue: BigInt.from(125000000000)), script, new Empty()]);
    List<DynType> cellOutputs = List<DynType>();
    cellOutputs.add(cellOutput);
    Dynamic<DynType> outputs = new Dynamic(cellOutputs);
    Uint8List expected = hexStringToByteArray(
        "71000000080000006900000010000000180000006900000000a2941a1d0000005100000010000000300000003100000068d5438ac952d2f584abf879527946a537e82c7f3c1cbf6d8ebf9767437d8e8801200000000800000014000000b2e61ff569acf041b3c2c17724e2379c581eeac3");
    expect(outputs.toBytes(), expected);
  });
}
