import '../../lib/ckb-wallet/credential.dart';
import '../../lib/ckb-utils/number.dart' as number;

void main() {
  Credential credential = Credential.fromPrivateKeyHex(
      "e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3");
  String pb = number.toHex(credential.publicKey, forcePadLen: 66);
  print(credential.privateKey);
  print(credential.publicKey);
  print(pb);
}
