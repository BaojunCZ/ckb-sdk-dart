import 'dart:typed_data';
import 'dart:convert';
import 'package:pointycastle/digests/blake2b.dart';
import 'package:ckb_sdk/ckb-utils/crypto/hash.dart'
    show CKB_HASH_PERSONALIZATION;

class Blake2b {
  Blake2bDigest blake2bDigest;

  Blake2b({int digestSize = 32}) {
    blake2bDigest = Blake2bDigest(
        digestSize: digestSize,
        personalization: utf8.encode(CKB_HASH_PERSONALIZATION));
  }

  Uint8List process(Uint8List data) {
    return blake2bDigest.process(data);
  }

  update(Uint8List input) {
    blake2bDigest.update(input, 0, input.length);
  }

  Uint8List doFinal() {
    var out = new Uint8List(blake2bDigest.digestSize);
    var len = blake2bDigest.doFinal(out, 0);
    return out.sublist(0, len);
  }
}
