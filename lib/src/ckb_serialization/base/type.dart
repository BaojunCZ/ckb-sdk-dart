part of 'package:ckb_sdk/ckb_serialization.dart';

abstract class Type<T> {
 Uint8List toBytes();
 T getValue();
 int getLength();
}
