// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cell _$CellFromJson(Map<String, dynamic> json) {
  return Cell(
      json['capacity'] as int,
      json['lock'] as String,
      json['out_point'] == null
          ? null
          : OutPoint.fromJson(json['out_point'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CellToJson(Cell instance) => <String, dynamic>{
      'capacity': instance.capacity,
      'lock': instance.lock,
      'out_point': instance.outPoint
    };
