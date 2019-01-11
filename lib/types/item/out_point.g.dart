// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'out_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutPoint _$OutPointFromJson(Map<String, dynamic> json) {
  return OutPoint(json['hash'] as String, json['index'] as int);
}

Map<String, dynamic> _$OutPointToJson(OutPoint instance) =>
    <String, dynamic>{'hash': instance.hash, 'index': instance.index};
