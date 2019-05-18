import 'package:ckb_sdk/ckb-utils/crypto/crypto.dart';
import 'package:ckb_sdk/ckb-utils/number.dart';
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

  test('publicKeyFromPrivate', () {
    String publicKey = bytesToHex(publicKeyFromPrivate(
        hex.decode("e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3")));
    expect(publicKey, "24a501efd328e062c8675f2365970728c859c592beeefd6be8ead3d901330bc01");
  });

  test('publicKeyFromPrivateSign', () {
    String publicKey = bytesToHex(publicKeyFromPrivateSign(
        hex.decode("e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3")));
    expect(publicKey,
        "4a501efd328e062c8675f2365970728c859c592beeefd6be8ead3d901330bc01d1868c7dabbf50e52ca7311e1263f917a8ced1d033e82dc2a68bed69397382f4");
  });
}
