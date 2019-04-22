import 'package:ckb_sdk/ckb-utils/crypto/hash.dart';
import "package:ckb_sdk/ckb-utils/number.dart" as number;
import "package:pointycastle/ecc/curves/secp256k1.dart";

List<int> publicKeyFromPrivate(List<int> privateKey, bool compress) {
  var privateKeyNum = number.bytesToInt(privateKey);
  var p = ECCurve_secp256k1().G * privateKeyNum;
  return p.getEncoded(compress).sublist(0);
}

List<int> publicKeyFromPrivateSign(List<int> privateKey) {
  var privateKeyNum = number.bytesToInt(privateKey);
  var p = ECCurve_secp256k1().G * privateKeyNum;
  return p.getEncoded(false).sublist(1);
}

String blake160(String value) {
  return number.remove0x(blake2bHexString(value)).substring(0, 40);
}
