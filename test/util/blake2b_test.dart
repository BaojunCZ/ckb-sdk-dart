import 'dart:convert';
import 'package:test/test.dart';
import 'package:ckb_sdk/ckb-utils/blake2b.dart';
import 'package:ckb_sdk/ckb-utils/number.dart' as number;

main() {
  test('blake2b', () {
    final Blake2b blake2b = new Blake2b(digestSize: 32);
    var result = blake2b
        .process(utf8.encode("The quick brown fox jumps over the lazy dog"));
    expect("0xabfa2c08d62f6f567d088d6ba41d3bbbb9a45c241a8e3789ef39700060b5cee2",
        number.bytesToHex(result, include0x: true, forcePadLen: 64));
  });

  test('blake2b update', () {
    final Blake2b blake2b = new Blake2b(digestSize: 32);
    blake2b.update(utf8.encode(""));
    var out = blake2b.doFinal();
    String hash = number.bytesToHex(out, include0x: true, forcePadLen: 64);
    expect(hash,
        "0x44f4c69744d5f8c55d642062949dcae49bc4e7ef43d388c5a12f42b5633d163e");

    final Blake2b blake2b1 = new Blake2b(digestSize: 32);
    blake2b1.update(utf8.encode("The quick brown fox jumps over the lazy dog"));
    var out1 = blake2b1.doFinal();
    var hash1 = number.bytesToHex(out1, include0x: true, forcePadLen: 64);
    expect(hash1,
        "0xabfa2c08d62f6f567d088d6ba41d3bbbb9a45c241a8e3789ef39700060b5cee2");
  });
}
