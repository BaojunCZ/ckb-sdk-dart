// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendTransaction _$SendTransactionFromJson(Map<String, dynamic> json) {
  return SendTransaction(
      (json['deps'] as List)
          ?.map((e) =>
              e == null ? null : OutPoint.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['inputs'] as List)
          ?.map((e) =>
              e == null ? null : CellInput.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['outputs'] as List)
          ?.map((e) =>
              e == null ? null : CellOutput.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['version'] as int);
}

Map<String, dynamic> _$SendTransactionToJson(SendTransaction instance) =>
    <String, dynamic>{
      'deps': instance.deps,
      'inputs': instance.inputs,
      'outputs': instance.outputs,
      'version': instance.version
    };
