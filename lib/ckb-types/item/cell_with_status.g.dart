// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cell_with_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CellWithStatus _$CellWithStatusFromJson(Map<String, dynamic> json) {
  return CellWithStatus(
      json['cell'] == null
          ? null
          : CellOutput.fromJson(json['cell'] as Map<String, dynamic>),
      json['status'] as String);
}

Map<String, dynamic> _$CellWithStatusToJson(CellWithStatus instance) =>
    <String, dynamic>{'cell': instance.cell, 'status': instance.status};
