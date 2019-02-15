// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cell_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CellOutput _$CellOutputFromJson(Map<String, dynamic> json) {
  return CellOutput(json['capacity'] as int, json['data'] as String, json['lock'] as String,
      json['unlock'] == null ? null : Unlock.fromJson(json['unlock'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CellOutputToJson(CellOutput instance) => <String, dynamic>{
      'capacity': instance.capacity,
      'data': instance.data,
      'lock': instance.lock,
      'type': instance.type
    };
