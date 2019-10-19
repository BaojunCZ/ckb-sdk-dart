part of 'package:ckb_sdk/ckb_serialization.dart';

class Byte32 implements FixedType<Uint8List> {
  Uint8List value;
  Uint8List dest = Uint8List.fromList([
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00
  ]);

  Byte32({Uint8List bytes, String string}) {
    if (string != null) {
      bytes = hexStringToByteArray(string);
      if (bytes.length < 32) {
        bytes = arrayCopy(bytes, 0, dest, 0, bytes.length);
      }
    }
    if (bytes.length != 32) {
      throw UnsupportedError("Byte1 length error");
    }
    this.value = bytes;
  }

  @override
  int getLength() {
    return 32;
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
