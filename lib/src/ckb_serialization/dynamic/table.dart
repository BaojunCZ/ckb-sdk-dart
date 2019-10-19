part of 'package:ckb_sdk/ckb_serialization.dart';

class Table implements DynType<List<Type>> {
  List<Type> value;

  Table(this.value) {}

  @override
  int getLength() {
    int length = 0;
    for (int i = 0; i < value.length; i++) {
      length += value[i].getLength();
    }
    return length + (1 + value.length) * Uint32.BYTE_SIZE;
  }

  @override
  List<Type> getValue() {
    return value;
  }

  @override
  Uint8List toBytes() {
    int length = getLength();
    Uint8List dest = new Uint8List(length);
    arrayCopy(
        new Uint32(intValue: length).toBytes(), 0, dest, 0, Uint32.BYTE_SIZE);

    int offset = Uint32.BYTE_SIZE;
    int bytesOffset = Uint32.BYTE_SIZE * (1 + value.length);

    value.forEach((type) {
      Uint8List offsetBytes = new Uint32(intValue: bytesOffset).toBytes();
      arrayCopy(offsetBytes, 0, dest, offset, Uint32.BYTE_SIZE);

      // Bytes through offset
      arrayCopy(type.toBytes(), 0, dest, bytesOffset, type.getLength());

      offset += Uint32.BYTE_SIZE;
      bytesOffset += type.getLength();
    });

    return dest;
  }
}
