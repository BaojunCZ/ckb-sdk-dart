import 'package:ckb_sdk/ckb_crypto.dart';
import 'package:ckb_sdk/ckb_serialization.dart';
import 'package:test/test.dart';

main() {
  test('to bytes', () {
    Bytes bytes = new Bytes(string: "3954acece65096bfa81258983ddb83915fc56bd8");
    print(bytes.getLength());
    expect(
        bytes.toBytes(),
        hexStringToByteArray(
            "140000003954acece65096bfa81258983ddb83915fc56bd8"));
  });

  test('length', () {
    Bytes bytes = new Bytes(string: "3954acece65096bfa81258983ddb83915fc56bd8");
    expect(bytes.getLength(), 24);
  });
}
