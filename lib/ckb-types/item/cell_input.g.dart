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

Unlock _$UnlockFromJson(Map<String, dynamic> json) {
  return Unlock(
      (json['args'] as List)?.map((e) => e as int)?.toList(),
      json['binary'] as String,
      json['reference'],
      (json['signed_args'] as List)?.map((e) => e as int)?.toList(),
      json['version'] as int);
}

Map<String, dynamic> _$UnlockToJson(Unlock instance) => <String, dynamic>{
      'args': instance.args,
      'binary': instance.binary,
      'reference': instance.reference,
      'signed_args': instance.signedArgs,
      'version': instance.version
    };
