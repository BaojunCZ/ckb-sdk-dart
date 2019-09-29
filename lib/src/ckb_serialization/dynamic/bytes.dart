part of 'package:ckb_sdk/ckb_serialization.dart';

class Bytes implements DynType<Uint8List> {
  Uint8List value;

  Bytes({Uint8List bytes, String string}) {
    if (bytes == null) {
      bytes = hexStringToByteArray(string);
    }
    this.value = bytes;
  }

  @override
  int getLength() {
    return value.length + Uint32.BYTE_SIZE;
  }

  @override
  Uint8List getValue() {
    return value;
  }

  @override
  Uint8List toBytes() {
    Uint8List result = Uint8List(Uint32.BYTE_SIZE + value.length);
    arrayCopy(Uint32(intValue: value.length).toBytes(), 0, result, 0,
        Uint32.BYTE_SIZE);
    arrayCopy(value, 0, result, Uint32.BYTE_SIZE, value.length);
    return result;
  }
}
