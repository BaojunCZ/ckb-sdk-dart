import "package:pointycastle/ecc/api.dart";
import "package:pointycastle/ecc/curves/secp256k1.dart";
import "./number.dart";

final ECDomainParameters params = new ECCurve_secp256k1();

List<int> publicKeyFromPrivate(List<int> privateKey) {
  var privateKeyNum = bytesToInt(privateKey);
  var p = params.G * privateKeyNum;
  return p.getEncoded(true).sublist(0);
}
