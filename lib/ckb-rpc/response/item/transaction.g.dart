// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
      (json['deps'] as List)
          ?.map((e) =>
              e == null ? null : OutPoint.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['hash'] as String,
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

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'deps': instance.deps,
      'hash': instance.hash,
      'inputs': instance.inputs,
      'outputs': instance.outputs,
      'version': instance.version
    };
