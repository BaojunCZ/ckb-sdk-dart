part of 'package:ckb_sdk/ckb_serialization.dart';

class Struct implements FixedType<List<Type>> {
  List<Type> value;

  Struct(this.value) {}

  @override
  int getLength() {
    int length = 0;
    value.forEach((type) {
      length += type.getLength();
    });
    return length;
  }

  @override
  List<Type> getValue() {
    return value;
  }

  @override
  Uint8List toBytes() {
    int length = getLength();
    Uint8List result = Uint8List(length);
    int offset = 0;
    value.forEach((type) {
      int typeLenght = type.getLength();
      arrayCopy(type.toBytes(), 0, result, offset, typeLenght);
      offset += typeLenght;
    });
    return result;
  }
}
