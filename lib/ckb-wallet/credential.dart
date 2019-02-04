import '../ckb-utils/number.dart' as number;
import '../ckb-utils/crypto.dart' as crypto;
import '../ckb-utils/file.dart' as fileUtils;
import '../ckb-types//res_export.dart';

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

  String getAddress(Unlock unlock) {
    return unlock.getTypeHash();
  }

  Unlock getUnlockScript(String path,
      {int version: 0,
      String binary = "",
      dynamic reference: null,
      List<String> args: null}) {
    List<String> signedArgs = [];
    signedArgs.add(fileUtils.getScriptFromFile(path));
    signedArgs.add(number.toHex(publicKey, forcePadLen: 66));
    return Unlock(
      version,
      binary,
      signedArgs,
      args == null ? [] : args,
      reference,
    );
  }
}
