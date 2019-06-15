import 'package:ckb_sdk/ckb_crypto.dart';
import 'package:test/test.dart';

main() {
  test("blake2bHexString", () {
    String hash =
        blake2bHexString("0x024a501efd328e062c8675f2365970728c859c592beeefd6be8ead3d901330bc01");
    expect("36c329ed630d6ce750712a477543672adab57f4c6fd36a71496305456bb298db", hash);
  });

  test("blake2bUtf8String", () {
    String hash = blake2bUtf8String("The quick brown fox jumps over the lazy dog");
    expect("abfa2c08d62f6f567d088d6ba41d3bbbb9a45c241a8e3789ef39700060b5cee2", hash);
  });
}
