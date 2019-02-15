import "package:pointycastle/ecc/api.dart";
import "package:pointycastle/ecc/curves/secp256k1.dart";
import "./number.dart";
import 'dart:typed_data';
import 'package:pointycastle/api.dart';
import "package:pointycastle/digests/sha256.dart";
import "package:pointycastle/macs/hmac.dart";
import "package:pointycastle/signers/ecdsa_signer.dart";
import "number.dart" as number;

final ECDomainParameters params = new ECCurve_secp256k1();
final BigInt _halfCurveOrder = params.n ~/ BigInt.two;

List<int> publicKeyFromPrivate(List<int> privateKey, bool compress) {
  var privateKeyNum = bytesToInt(privateKey);
  var p = params.G * privateKeyNum;
  return p.getEncoded(compress).sublist(0);
}

List<int> publicKeyFromPrivateSign(List<int> privateKey) {
  var privateKeyNum = bytesToInt(privateKey);
  var p = params.G * privateKeyNum;
  return p.getEncoded(false).sublist(1);
}

class MsgSignature {
  final Uint8List r;
  final Uint8List s;
  final int v;

  MsgSignature(this.r, this.s, this.v);

  Uint8List getDerSignature() {
    int rLen = (r[0] & 0xFF) > 0x7F ? r.length + 1 : r.length;
    int sLen = (s[0] & 0xFF) > 0x7F ? s.length + 1 : s.length;
    int len = 6 + rLen + sLen;
    Uint8List sig = Uint8List(len);

    sig[0] = 0x30;
    sig[1] = (len - 2);
    sig[2] = 0x02;
    sig[3] = rLen;

    if ((r[0] & 0xFF) > 0x7F) {
      sig[4] = 0x00;
      number.arrayCopy(r, 0, sig, 5, rLen - 1);
    } else {
      number.arrayCopy(r, 0, sig, 4, rLen);
    }

    sig[4 + rLen] = 0x02;
    sig[4 + rLen + 1] = sLen;

    if ((s[0] & 0xFF) > 0x7F) {
      sig[4 + rLen + 2] = 0x00;
      number.arrayCopy(s, 0, sig, 4 + rLen + 3, sLen - 1);
    } else {
      number.arrayCopy(s, 0, sig, 4 + rLen + 2, sLen);
    }

    return sig;
  }
}

MsgSignature sign(Uint8List messageHash, Uint8List privateKey) {
  var digest = new SHA256Digest();
  var signer = new ECDSASigner(null, new HMac(digest, 64));
  var key = new ECPrivateKey(number.bytesToInt(privateKey), params);

  signer.init(true, new PrivateKeyParameter(key));
  ECSignature sig = signer.generateSignature(messageHash);

  if (sig.s.compareTo(_halfCurveOrder) > 0) {
    var canonicalisedS = params.n - sig.s;
    sig = new ECSignature(sig.r, canonicalisedS);
  }

  var publicKey = number.bytesToInt(publicKeyFromPrivateSign(privateKey));

  var recId = -1;
  for (var i = 0; i < 4; i++) {
    var k = _recoverFromSignature(i, sig, messageHash, params);
    if (k == publicKey) {
      recId = i;
      break;
    }
  }

  if (recId == -1) {
    throw new Exception("Could not construct a recoverable key. This should never happen");
  }

  return new MsgSignature(
      Uint8List.fromList(number.toBytesPadded(sig.r, 32)), Uint8List.fromList(number.toBytesPadded(sig.s, 32)), recId);
}

BigInt _recoverFromSignature(int recId, ECSignature sig, Uint8List msg, ECDomainParameters params) {
  var n = params.n;
  var i = new BigInt.from(recId ~/ 2);
  var x = sig.r + (i * n);

  var prime = BigInt.parse("fffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f", radix: 16);
  if (x.compareTo(prime) >= 0) return null;

  var R = _decompressKey(x, (recId & 1) == 1, params.curve);
  if (!(R * n).isInfinity) return null;

  var e = number.bytesToInt(msg);

  var eInv = (BigInt.zero - e) % n;
  var rInv = sig.r.modInverse(n);
  var srInv = (rInv * sig.s) % n;
  var eInvrInv = (rInv * eInv) % n;

  var q = (params.G * eInvrInv) + (R * srInv);

  var bytes = q.getEncoded(false);
  return number.bytesToInt(bytes.sublist(1));
}

ECPoint _decompressKey(BigInt xBN, bool yBit, ECCurve c) {
  List<int> x9IntegerToBytes(BigInt s, int qLength) {
    var bytes = number.intToBytes(s);

    if (qLength < bytes.length) {
      return bytes.sublist(0, bytes.length - qLength);
    } else if (qLength > bytes.length) {
      var tmp = new List<int>.filled(qLength, 0);

      var offset = qLength - bytes.length;
      for (var i = 0; i < bytes.length; i++) {
        tmp[i + offset] = bytes[i];
      }

      return tmp;
    }

    return bytes;
  }

  var compEnc = x9IntegerToBytes(xBN, 1 + ((c.fieldSize + 7) ~/ 8));
  compEnc[0] = yBit ? 0x03 : 0x02;
  return c.decodePoint(compEnc);
}
