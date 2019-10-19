part of 'package:ckb_sdk/ckb_serialization.dart';

class Fixed<T extends FixedType> implements Type<List<T>> {
  List<T> value;

  Fixed(this.value);

  @override
  int getLength() {
    int length = Uint32.BYTE_SIZE;
    for (FixedType type in value) {
      length += type.getLength();
    }
    return length;
  }

  @override
  List<T> getValue() {
    return value;
  }

  @override
  Uint8List toBytes() {
    int fullLength = getLength();
    Uint8List dest = Uint8List(fullLength);

    // full length bytes
    arrayCopy(new Uint32(intValue: value.length).toBytes(), 0, dest, 0,
        Uint32.BYTE_SIZE);

    int offset = Uint32.BYTE_SIZE;
    for (FixedType type in value) {
      // Bytes through offset
      arrayCopy(type.toBytes(), 0, dest, offset, type.getLength());
      offset += type.getLength();
    }
    return dest;
  }
}
