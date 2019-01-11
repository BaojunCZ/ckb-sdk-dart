// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uncle_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UncleBlock _$UncleBlockFromJson(Map<String, dynamic> json) {
  return UncleBlock(
      json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      json['cellbase'] == null
          ? null
          : Transaction.fromJson(json['cellbase'] as Map<String, dynamic>),
      (json['proposal_transactions'] as List)?.map((e) => e as int)?.toList());
}

Map<String, dynamic> _$UncleBlockToJson(UncleBlock instance) =>
    <String, dynamic>{
      'header': instance.header,
      'cellbase': instance.cellbase,
      'proposal_transactions': instance.proposalTransactions
    };
