part of 'package:ckb_sdk/ckb_crypto.dart';

Uint8List publicKeyFromPrivate(Uint8List privateKey, {bool compress = true}) {
  var privateKeyNum = bytesToInt(privateKey);
  var p = ECCurve_secp256k1().G * privateKeyNum;
  return p.getEncoded(compress).sublist(0);
}

Uint8List publicKeyFromPrivateSign(Uint8List privateKey) {
  var privateKeyNum = bytesToInt(privateKey);
  var p = ECCurve_secp256k1().G * privateKeyNum;
  return p.getEncoded(false).sublist(1);
}

String blake160(String value) {
  return remove0x(blake2bHexString(value)).substring(0, 40);
}
