import 'package:ckb_sdk/ckb-utils/number.dart';
import 'package:test/test.dart';

main() {
  test('hex string to byte array', () {
    expect(hexStringToByteArray("1"), [0x1]);
    expect(hexStringToByteArray("0"), [0]);
    expect(hexStringToByteArray("0x123"), [0x1, 0x23]);
  });

  test('litlle endian', () {
    expect(littleEndian(71), "0x4700000000000000");
  });
}
