import 'package:test/test.dart';
import 'dart:convert';
import 'package:pointycastle/digests/blake2b.dart';
import 'package:convert/convert.dart';

main() {
  test('blake2b', () {
    final Blake2bDigest blake2bDigest = new Blake2bDigest(digestSize: 32);
    var result = blake2bDigest.process(utf8.encode("The quick brown fox jumps over the lazy dog"));
    expect("01718cec35cd3d796dd00020e0bfecb473ad23457d063b75eff29c0ffa2e58a9", hex.encode(result));
  });
}
