part of 'package:ckb_sdk/ckb_serialization.dart';

class Uint64 implements FixedType<BigInt> {
  BigInt value;

  Uint64({BigInt intValue, Uint8List bytesValue, String string}) {
    if (bytesValue != null) {
      int result = 0;
      for (int i = 7; i >= 0; i--) {
        result += (bytesValue[i] & 0xff) << 8 * i;
      }
      this.value = BigInt.from(result);
    }
    if (string != null) {
      intValue = BigInt.parse(remove0x(string), radix: 16);
    }
    this.value = intValue;
  }

  @override
  int getLength() {
    return 8;
  }

  @override
  BigInt getValue() {
    return value;
  }

  @override
  Uint8List toBytes() {
    Uint8List result = Uint8List(8);
    int valueInt = value.toInt();
    result[7] = valueInt >> 56 & 0xff;
    result[6] = valueInt >> 48 & 0xff;
    result[5] = valueInt >> 40 & 0xff;
    result[4] = valueInt >> 32 & 0xff;
    result[3] = valueInt >> 24 & 0xff;
    result[2] = valueInt >> 16 & 0xff;
    result[1] = valueInt >> 8 & 0xff;
    result[0] = valueInt & 0xff;
    return result;
  }
}
