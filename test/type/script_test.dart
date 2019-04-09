import 'package:ckb_sdk/ckb_sdk.dart';
import 'package:test/test.dart';

void main() {
  final String ZERO_HASH = "0000000000000000000000000000000000000000000000000000000000000000";

  test('empty script type hash', () {
    Script script = Script(0, ZERO_HASH, []);
    expect(
        "0x266cec97cbede2cfbce73666f08deed9560bdf7841a7a5a51b3a3f09da249e21", script.getTypeHash());
  });

  test('script type hash', () {
    Script script = Script(0, ZERO_HASH, ["0x01"]);
    expect(
        "0xdade0e507e27e2a5995cf39c8cf454b6e70fa80d03c1187db7a4cb2c9eab79da", script.getTypeHash());
  });
}