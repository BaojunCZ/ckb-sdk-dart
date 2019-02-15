// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cell_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CellInput _$CellInputFromJson(Map<String, dynamic> json) {
  return CellInput(
      json['previous_output'] == null
          ? null
          : PreviousOutput.fromJson(
              json['previous_output'] as Map<String, dynamic>),
      json['unlock'] == null
          ? null
          : Unlock.fromJson(json['unlock'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CellInputToJson(CellInput instance) => <String, dynamic>{
      'previous_output': instance.previousOutput,
      'unlock': instance.unlock
    };

PreviousOutput _$PreviousOutputFromJson(Map<String, dynamic> json) {
  return PreviousOutput(json['hash'] as String, json['index'] as int);
}

Map<String, dynamic> _$PreviousOutputToJson(PreviousOutput instance) =>
    <String, dynamic>{'hash': instance.hash, 'index': instance.index};
