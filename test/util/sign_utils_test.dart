import 'dart:typed_data';

import 'package:ckb_sdk/ckb_crypto.dart';
import 'package:convert/convert.dart';
import 'package:test/test.dart';

void main() {
  Uint8List privateKey =
      hex.decode("e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3");
  test("test sign message", () {
    String message = "95e919c41e1ae7593730097e9bb1185787b046ae9f47b4a10ff4e22f9c3e3eab";
    Uint8List messageHash = hex.decode(message);
    String signature = bytesToHex(sign(messageHash, privateKey).getSignature(), include0x: true);
    expect(signature,
        "0x1e94db61cff452639cf7dd991cf0c856923dcf74af24b6f575b91479ad2c8ef40769812d1cf1fd1a15d2f6cb9ef3d91260ef27e65e1f9be399887e9a5447786301");
  });
}
