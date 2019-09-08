part of 'package:ckb_sdk/ckb_serialization.dart';

class Byte1 implements FixedType<Uint8List> {
  Uint8List value;

  Byte1({Uint8List bytes, String string}) {
    if (string != null) {
      bytes = hexStringToByteArray(string);
    }
    if (null == bytes || bytes.length != 1) {
      throw UnsupportedError("Byte1 length error");
    }
    this.value = bytes;
  }

  @override
  int getLength() {
    return 1;
  }

  @override
  Uint8List getValue() {
    return value;
  }

  @override
  Uint8List toBytes() {
    return value;
  }
}
