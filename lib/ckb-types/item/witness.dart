import 'dart:typed_data';

import 'package:ckb_sdk/ckb-utils/crypto/crypto.dart';
import 'package:ckb_sdk/ckb-utils/crypto/sign.dart';
import 'package:ckb_sdk/ckb-utils/number.dart';
import 'package:convert/convert.dart';

class Witness {
  List<String> data;
  Witness(this.data);
  factory Witness.fromJson(Map<String, dynamic> json) => Witness(
        (json['data'] as List)?.map((e) => e as String)?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': this.data,
      };

  factory Witness.sign(Uint8List privateKey, String txHash) {
    var txHashBytes = hex.decode(remove0x(txHash));
    Uint8List signatureBytes = sign(txHashBytes, privateKey).getDerSignature();
    String signature = bytesToHex(signatureBytes, include0x: true);
    String publicKey =
        bytesToHex(publicKeyFromPrivate(privateKey), include0x: true, forcePadLen: 66);
    String signatureSize = littleEndian(signatureBytes.length);
    return Witness([publicKey, signature, signatureSize]);
  }
}
