import 'package:test/test.dart';
import 'package:ckb_sdk/ckb-utils/number.dart';

main() {
  test('hex string to byte array', () {
    expect(hexStringToByteArray("1"), [0x1]);
    expect(hexStringToByteArray("0"), [0]);
    expect(hexStringToByteArray("0x123"), [0x1, 0x23]);
  });
}