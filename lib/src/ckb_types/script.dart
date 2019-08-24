part of 'package:ckb_sdk/ckb_types.dart';

class Script {
  static const String DATA = "data";
  static const String TYPE = "type";

  String codeHash;
  List<String> args;
  String hashType;

  Script(this.codeHash, this.args, {this.hashType = DATA});

  String get scriptHash {
    final Blake2b blake2b = new Blake2b(digestSize: 32);
    if (codeHash != null) blake2b.update(hex.decode(remove0x(codeHash)));

    switch (hashType) {
      case DATA:
        blake2b.update(hexStringToByteArray("0"));
        break;
      case TYPE:
        blake2b.update(hexStringToByteArray("1"));
        break;
      default:
        throw new InvalidHashTypeException();
    }
    args.forEach((arg) {
      blake2b.update(hexStringToByteArray(arg));
    });
    var hash_bytes = blake2b.doFinal();
    return bytesToHex(hash_bytes, include0x: true, forcePadLen: 64);
  }

  factory Script.fromJson(Map<String, dynamic> json) => Script(
        json['code_hash'] as String,
        (json['args'] as List)?.map((e) => e as String)?.toList(),
        hashType: json['hash_type'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code_hash': codeHash,
        'args': args,
        'hash_type': hashType,
      };
}
