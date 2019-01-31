// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Block _$BlockFromJson(Map<String, dynamic> json) {
  return Block(
      json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      (json['uncles'] as List)
          ?.map((e) =>
              e == null ? null : UncleBlock.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['proposal_transactions'] as List)?.map((e) => e as int)?.toList(),
      (json['commit_transactions'] as List)
          ?.map((e) => e == null
              ? null
              : Transaction.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$BlockToJson(Block instance) => <String, dynamic>{
      'header': instance.header,
      'uncles': instance.uncles,
      'proposal_transactions': instance.proposalTransactions,
      'commit_transactions': instance.commitTransactions
    };
