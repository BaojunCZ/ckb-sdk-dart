part of 'package:ckb_sdk/ckb_crypto.dart';

const CKB_HASH_PERSONALIZATION = "ckb-default-hash";

Uint8List blake2b(Uint8List input) {
  Blake2b blake2b = Blake2b();
  blake2b.update(input);
  return blake2b.doFinal();
}

String blake2bHexString(String hexInput) {
  Uint8List bytes = hexStringToByteArray(hexInput);
  Uint8List blake2bBytes = blake2b(bytes);
  return hex.encode(blake2bBytes);
}

String blake2bUtf8String(String utf8Input) {
  return bytesToHex(blake2b(utf8.encode(utf8Input)));
}

class Blake2b {
  Blake2bDigest blake2bDigest;

  Blake2b({int digestSize = 32}) {
    blake2bDigest = Blake2bDigest(
        digestSize: digestSize, personalization: utf8.encode(CKB_HASH_PERSONALIZATION));
  }

  Uint8List process(Uint8List data) {
    return blake2bDigest.process(data);
  }

  update(Uint8List input) {
    blake2bDigest.update(input, 0, input.length);
  }

  Uint8List doFinal() {
    var out = new Uint8List(blake2bDigest.digestSize);
    var len = blake2bDigest.doFinal(out, 0);
    return out.sublist(0, len);
  }
}
