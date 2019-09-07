part of 'package:ckb_sdk/ckb_serialization.dart';

abstract class Type<T> {
 List<int> toBytes();
 T getValue();
 int getLength();
}
