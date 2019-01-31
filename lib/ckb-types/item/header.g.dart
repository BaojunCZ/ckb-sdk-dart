// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Header _$HeaderFromJson(Map<String, dynamic> json) {
  return Header(
      json['cellbase_id'] as String,
      json['difficulty'] as String,
      json['hash'] as String,
      json['number'] as int,
      json['parent_hash'] as String,
      json['seal'] == null
          ? null
          : Seal.fromJson(json['seal'] as Map<String, dynamic>),
      json['timestamp'] as int,
      json['txs_commit'] as String,
      json['txs_proposal'] as String,
      json['uncles_count'] as int,
      json['uncles_hash'] as String,
      json['version'] as int);
}

Map<String, dynamic> _$HeaderToJson(Header instance) => <String, dynamic>{
      'cellbase_id': instance.cellbaseId,
      'difficulty': instance.difficulty,
      'hash': instance.hash,
      'number': instance.number,
      'parent_hash': instance.parentHash,
      'seal': instance.seal,
      'timestamp': instance.timestamp,
      'txs_commit': instance.txsCommit,
      'txs_proposal': instance.txsProposal,
      'uncles_count': instance.unclesCount,
      'uncles_hash': instance.unclesHash,
      'version': instance.version
    };

Seal _$SealFromJson(Map<String, dynamic> json) {
  return Seal(json['nonce'] as int, json['proof'] as String);
}

Map<String, dynamic> _$SealToJson(Seal instance) =>
    <String, dynamic>{'nonce': instance.nonce, 'proof': instance.proof};
