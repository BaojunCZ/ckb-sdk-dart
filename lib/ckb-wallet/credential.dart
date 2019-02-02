import '../ckb-utils/number.dart' as number;
import '../ckb-utils/crypto.dart' as crypto;

class Credential {
  final BigInt privateKey;
  final BigInt publicKey;

  const Credential._(this.privateKey, this.publicKey);

  static Credential fromPrivateKeyBigInt(BigInt privateKey) {
    BigInt publicKey = _privateKeyToPulic(privateKey);
    return new Credential._(privateKey, publicKey);
  }

  static Credential fromPrivateKeyHex(String hex) {
    BigInt privateKey = number.toBigInt(number.remove0x(hex));
    return fromPrivateKeyBigInt(privateKey);
  }

  static BigInt _privateKeyToPulic(BigInt privateKey) {
    var list = number.numberToBytes(privateKey);
    var pkBigInt = number.bytesToInt(crypto.publicKeyFromPrivate(list));
    return pkBigInt;
  }
}
