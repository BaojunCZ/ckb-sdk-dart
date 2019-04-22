import 'package:ckb_sdk/ckb-utils/crypto/blake2b.dart';
import 'package:ckb_sdk/ckb-utils/number.dart' as number;
import 'package:convert/convert.dart';

class Script {
  final String ALWAYS_SUCCESS_HASH =
      "0000000000000000000000000000000000000000000000000000000000000001";

  String binaryHash;
  List<String> args;

  Script(this.binaryHash, this.args);

  Script alwaysSuccess() => Script(ALWAYS_SUCCESS_HASH, []);

  String getTypeHash() {
    final Blake2b blake2b = new Blake2b(digestSize: 32);
    if (binaryHash != null)
      blake2b.update(hex.decode(number.remove0x(binaryHash)));
    args.forEach((arg) {
      blake2b.update(number.hexStringToByteArray(arg));
    });
    var hash_bytes = blake2b.doFinal();
    return number.bytesToHex(hash_bytes, include0x: true, forcePadLen: 64);
  }

  factory Script.fromJson(Map<String, dynamic> json) => Script(
        json['binary_hash'] as String,
        (json['args'] as List)?.map((e) => e as String)?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'binaryHash': binaryHash,
        'args': args,
      };
}
