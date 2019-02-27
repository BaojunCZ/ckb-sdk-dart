import 'dart:math';
import 'package:ckb_dart_sdk/ckb-utils/number.dart' as number;
import 'package:ckb_dart_sdk/ckb-utils/crypto.dart' as crypto;
import 'package:ckb_dart_sdk/ckb-utils/file.dart' as fileUtils;
import 'package:ckb_dart_sdk/ckb-types/res_export.dart';
import 'package:ckb_dart_sdk/ckb-wallet/wallet_constant.dart';

class Credential {
  final BigInt privateKey;
  final BigInt publicKey;

  const Credential._(this.privateKey, this.publicKey);

  static Credential createRandom(Random random) {
    var privateKey = crypto.generateNewPrivateKey(random);
    return fromPrivateKeyBigInt(privateKey);
  }

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
    var pkBigInt = number.bytesToInt(crypto.publicKeyFromPrivate(list, true));
    return pkBigInt;
  }

  String getAddress(Unlock unlock) {
    return unlock.getTypeHash();
  }

  Unlock getUnlockScript(String path,
      {int version: VERSION,
      String binary = null,
      String reference = "",
      List<String> args: null}) {
    List<String> signedArgs = [];
    signedArgs.add(fileUtils.getScriptFromFile(path));
    signedArgs.add(number.toHex(publicKey, forcePadLen: 66));
    return Unlock(
      version,
      reference,
      signedArgs,
      args == null ? [] : args,
      binary,
    );
  }
}
