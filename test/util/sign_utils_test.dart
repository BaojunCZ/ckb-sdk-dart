import 'dart:typed_data';

import 'package:ckb_sdk/ckb-utils/number.dart';
import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:ckb_sdk/ckb-utils/crypto/sign.dart';

void main() {
  Uint8List privateKey =
      hex.decode("e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3");
  String message = "403676bd85716a1e16b415093cee88c07d7cf2c2199aaf82320d354cb571f0d9";
  Uint8List messageHash = hex.decode(message);

  test("test sign message", () {
    String signature = bytesToHex(sign(messageHash, privateKey).getDerSignature(), include0x: true);
    expect(signature,
        "0x3045022100c795b2b3c48d370324e5053f4509d4f1f18f80aec4a8cba68ebae922b9f882d8022045ae312bd84e25eed818ef84e7ed61a774f208fe2b2fe3588b60b46860862082");
  });
}
