import 'package:convert/convert.dart';
import 'package:ckb_sdk/ckb-utils/blake2b.dart';
import 'package:ckb_sdk/ckb-utils/number.dart' as number;

class Script {
  final String ALWAYS_SUCCESS_HASH =
      "0000000000000000000000000000000000000000000000000000000000000001";

  int version;
  String binaryHash;
  List<String> args;

  Script(this.version, this.binaryHash, this.args);

  Script alwaysSuccess() => Script(0, ALWAYS_SUCCESS_HASH, []);

  String getTypeHash() {
    final Blake2b blake2b = new Blake2b(digestSize: 32);
    if (binaryHash != null) blake2b.update(hex.decode(number.remove0x(binaryHash)));
    args.forEach((arg) {
      blake2b.update(number.hexStringToByteArray(arg));
    });
    var hash_bytes = blake2b.doFinal();
    return number.bytesToHex(hash_bytes, include0x: true, forcePadLen: 64);
  }

  factory Script.fromJson(Map<String, dynamic> json) => Script(
        json['version'] as int,
        json['binary_hash'] as String,
        (json['args'] as List)?.map((e) => e as String)?.toList(),
      );
}
