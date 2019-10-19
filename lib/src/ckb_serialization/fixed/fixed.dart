part of 'package:ckb_sdk/ckb_serialization.dart';

class Fixed<T extends FixedType> implements Type<List<T>> {
  List<T> value;

  Fixed(this.value);

  @override
  int getLength() {
    return null;
  }

  @override
  List<T> getValue() {
    return value;
  }

  @override
  Uint8List toBytes() {
    return null;
  }
}
