import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:ckb_dart_sdk/ckb-utils/blake2b.dart';
import 'package:ckb_dart_sdk/ckb-utils/number.dart' as number;

class Unlock {
  List<String> args;
  String binary;
  String reference;
  List<String> signedArgs;
  int version;
  String typeHash;

  Unlock(this.version, this.reference, this.signedArgs, this.args, this.binary);

  factory Unlock.fromJson(Map<String, dynamic> json) {
    return Unlock(
      json['version'] as int,
      json['reference'] as String,
      (json['signed_args'] as List)?.map((e) => e as String)?.toList(),
      (json['args'] as List)?.map((e) => e as String)?.toList(),
      json['binary'] as String,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'args': this.args,
        'binary': this.binary,
        'reference': this.reference,
        'signed_args': this.signedArgs,
        'version': this.version,
        'typeHash': this.typeHash,
      };

  String getTypeHash() {
    final Blake2b blake2b = new Blake2b(digestSize: 32);
    if (reference != null)
      blake2b.update(hex.decode(number.remove0x(reference)));
    blake2b.update(utf8.encode("|"));
    if (binary != null) {
      blake2b.update(hex.decode(number.remove0x(binary)));
    }
    signedArgs.forEach((signedArg) {
      blake2b.update(hex.decode(number.remove0x(signedArg)));
    });
    var hash_bytes = blake2b.doFinal();
    return number.bytesToHex(hash_bytes, include0x: true, forcePadLen: 64);
  }
}
