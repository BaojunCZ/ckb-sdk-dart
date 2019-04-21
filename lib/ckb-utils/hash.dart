import 'dart:convert';
import 'dart:typed_data';

import 'package:ckb_sdk/ckb-utils/blake2b.dart';
import 'package:ckb_sdk/ckb-utils/number.dart' as number;

const CKB_HASH_PERSONALIZATION = "ckb-default-hash";

Uint8List blake2b(Uint8List input) {
  Blake2b blake2b = Blake2b();
  blake2b.update(input);
  return blake2b.doFinal();
}

String blake2bHexString(String hexInput) {
  return number.bytesToHex(blake2b(number.hexStringToByteArray(hexInput)));
}

String blake2bUtf8String(String utf8Input) {
  return number.bytesToHex(blake2b(utf8.encode(utf8Input)));
}
