import 'dart:convert';
import 'dart:typed_data';

import 'package:ckb_sdk/ckb-utils/crypto/blake2b.dart';
import 'package:ckb_sdk/ckb-utils/number.dart' as number;

const CKB_HASH_PERSONALIZATION = "ckb-default-hash";

Uint8List blake2b(Uint8List input) {
  Blake2b blake2b = Blake2b();
  blake2b.update(input);
  return blake2b.doFinal();
}

String blake2bHexString(String hexInput) {
  Uint8List bytes = number.hexStringToByteArray(hexInput);
  Uint8List blake2bBytes = blake2b(bytes);
  return number.bytesToHex(blake2bBytes, include0x: true);
}

String blake2bUtf8String(String utf8Input) {
  return number.bytesToHex(blake2b(utf8.encode(utf8Input)), include0x: true);
}
