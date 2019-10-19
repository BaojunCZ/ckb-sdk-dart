part of 'package:ckb_sdk/ckb_serialization.dart';

class Dynamic<T extends Type> implements Type<List<T>> {
  List<T> value;
  Dynamic(this.value);

  @override
  int getLength() {
    int length = (1 + value.length) * Uint32.BYTE_SIZE;
    value.forEach((type) {
      length += type.getLength();
    });
    return length;
  }

  @override
  List<T> getValue() {
    return value;
  }

  @override
  Uint8List toBytes() {
    int fullLength = getLength();
    Uint8List result = new Uint8List(fullLength);
    arrayCopy(
        Uint32(intValue: fullLength).toBytes(), 0, result, 0, Uint32.BYTE_SIZE);

    int offset = Uint32.BYTE_SIZE;
    int bytesOffset = Uint32.BYTE_SIZE * (1 + value.length);

    value.forEach((type) {
      // offset of every Bytes
      Uint8List offsetBytes = Uint32(intValue: bytesOffset).toBytes();
      arrayCopy(offsetBytes, 0, result, offset, Uint32.BYTE_SIZE);

      // Bytes through offset
      arrayCopy(type.toBytes(), 0, result, bytesOffset, type.getLength());

      offset += Uint32.BYTE_SIZE;
      bytesOffset += type.getLength();
    });
    return result;
  }
}
