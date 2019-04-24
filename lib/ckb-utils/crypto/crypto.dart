import 'dart:typed_data';

import 'package:ckb_sdk/ckb-utils/crypto/hash.dart';
import "package:ckb_sdk/ckb-utils/number.dart" as number;
import "package:pointycastle/ecc/curves/secp256k1.dart";

Uint8List publicKeyFromPrivate(Uint8List privateKey, {bool compress = true}) {
  var privateKeyNum = number.bytesToInt(privateKey);
  var p = ECCurve_secp256k1().G * privateKeyNum;
  return p.getEncoded(compress).sublist(0);
}

Uint8List publicKeyFromPrivateSign(Uint8List privateKey) {
  var privateKeyNum = number.bytesToInt(privateKey);
  var p = ECCurve_secp256k1().G * privateKeyNum;
  return p.getEncoded(false).sublist(1);
}

String blake160(String value) {
  return number.remove0x(blake2bHexString(value)).substring(0, 40);
}
