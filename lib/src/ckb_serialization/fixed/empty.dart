part of 'package:ckb_sdk/ckb_serialization.dart';

class Empty implements FixedType {
  @override
  int getLength() {
    return 0;
  }

  @override
  getValue() {
    return null;
  }

  @override
  Uint8List toBytes() {
    return Uint8List.fromList([]);
  }
}
