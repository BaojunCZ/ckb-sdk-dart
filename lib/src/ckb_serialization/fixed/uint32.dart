part of 'package:ckb_sdk/ckb_serialization.dart';

class Uint32 implements FixedType<int> {
  static const BYTE_SIZE = 4;
  int value;

  Uint32({int intValue, Uint8List bytesValue, String string}) {
    if (bytesValue != null) {
      int result = 0;
      for (int i = 3; i >= 0; i--) {
        result += (bytesValue[i] & 0xff) << 8 * i;
      }
      intValue = result;
    }
    if (string != null) {
      intValue = int.parse(string, radix: 16);
    }
    value = intValue;
  }

  @override
  int getLength() {
    return BYTE_SIZE;
  }

  @override
  int getValue() {
    return value;
  }

  @override
  Uint8List toBytes() {
    Uint8List result = Uint8List(4);
    result[3] = value >> 24 & 0xff;
    result[2] = value >> 16 & 0xff;
    result[1] = value >> 8 & 0xff;
    result[0] = value & 0xff;
    return result;
  }
}
