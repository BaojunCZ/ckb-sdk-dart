import 'dart:convert';
import 'package:ckb_dart_sdk/ckb-utils/sha3.dart';
import 'package:convert/convert.dart';
import 'dart:typed_data';
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
    SHA3Digest sha3 = SHA3Digest(256);
    _update(sha3, hex.decode(number.remove0x(reference)));
    _update(sha3, utf8.encode("|"));
    if (binary != null) {
      _update(sha3, hex.decode(binary));
    }
    signedArgs.forEach((signedArg) {
      _update(sha3, utf8.encode(signedArg));
    });
    var out = new Uint8List(sha3.digestSize);
    var len = sha3.doFinal(out, 0);
    var hash_bytes = out.sublist(0, len);
    return number.bytesToHex(hash_bytes, include0x: true, forcePadLen: 64);
  }

  _update(SHA3Digest sha3, Uint8List input) {
    return sha3.update(input, 0, input.length);
  }
}
