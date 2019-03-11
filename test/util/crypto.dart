import 'package:test/test.dart';
import 'dart:convert';
import 'package:ckb_sdk/ckb-utils/sha3.dart';
import 'package:pointycastle/digests/blake2b.dart';
import 'package:convert/convert.dart';

main() {
  test("sh3", () {
    const int _shaBytes = 256 ~/ 8;
    final SHA3Digest sha3digest = new SHA3Digest(_shaBytes * 8);
    var result = sha3digest.process(utf8.encode("hello ckb"));
    expect("f3ac0212947c7de8cea1a48c8b5534e771d1644ab77b8dede1d8e7af0f83791c",
        hex.encode(result));
  });

  test('blake2b', () {
    final Blake2bDigest blake2bDigest = new Blake2bDigest(digestSize: 32);
    var result = blake2bDigest
        .process(utf8.encode("The quick brown fox jumps over the lazy dog"));
    expect("01718cec35cd3d796dd00020e0bfecb473ad23457d063b75eff29c0ffa2e58a9",
        hex.encode(result));
  });
}
