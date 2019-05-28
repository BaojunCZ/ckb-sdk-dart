import 'dart:convert';
import 'dart:typed_data';

import 'package:ckb_sdk/ckb-types/item/script.dart';
import 'package:ckb_sdk/ckb-utils/crypto/blake2b.dart';
import 'package:ckb_sdk/ckb-utils/number.dart' as number;
import 'package:convert/convert.dart';

const CKB_HASH_PERSONALIZATION = "ckb-default-hash";

Uint8List blake2b(Uint8List input) {
  Blake2b blake2b = Blake2b();
  blake2b.update(input);
  return blake2b.doFinal();
}

String blake2bHexString(String hexInput) {
  Uint8List bytes = number.hexStringToByteArray(hexInput);
  Uint8List blake2bBytes = blake2b(bytes);
  return hex.encode(blake2bBytes);
}

String blake2bUtf8String(String utf8Input) {
  return number.bytesToHex(blake2b(utf8.encode(utf8Input)));
}

String lockScriptToHash(Script script) {
  final Blake2b blake2b = new Blake2b(digestSize: 32);
  if (script.codeHash != null) blake2b.update(hex.decode(number.remove0x(script.codeHash)));
  script.args.forEach((arg) {
    blake2b.update(number.hexStringToByteArray(arg));
  });
  var hash_bytes = blake2b.doFinal();
  return number.bytesToHex(hash_bytes, include0x: true, forcePadLen: 64);
}
