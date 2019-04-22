import 'dart:typed_data';

import 'package:ckb_sdk/ckb-utils/number.dart';
import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:ckb_sdk/ckb-utils/crypto/sign.dart';

void main() {
  Uint8List privateKey = hex.decode(
      "e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3");
  String message =
      "85a1feafb48eae47b88308f525b759d651986e5a4d80a5915cb5d28566d6c7c5";
  Uint8List messageHash = hex.decode(message);

  test("test sign message", () {
    String signature = bytesToHex(
        sign(messageHash, privateKey).getDerSignature(),
        include0x: true);
    expect(signature,
        "0x3045022100be85e76bf2c9ce4042dc9e1d12209ad552e826e83e1e4e8c06198a0fa28de17f02205dd2b43723d7f819f26de60ef275d793229fd0b310c393d30584947f811ff376");
  });
}
