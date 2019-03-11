import 'package:test/test.dart';
import 'package:ckb_sdk/ckb-wallet/credential.dart';
import 'package:ckb_sdk/ckb-utils/number.dart' as number;

void main() {
  test('from hex', () {
    Credential credential = Credential.fromPrivateKeyHex(
        "e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3");
    String pb = number.toHex(credential.publicKey, forcePadLen: 66);
    String privateKeyHex = number.toHex(credential.privateKey);
    print(credential.privateKey);
    print(privateKeyHex);
    print(credential.publicKey);
    print(pb);
  });
}
