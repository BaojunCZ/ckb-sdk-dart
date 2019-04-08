/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:31:46
 * @Description: file content
 */
import 'package:ckb_sdk/ckb-types/item/witness.dart';

class Header {
  String cellbaseId;
  String difficulty;
  String hash;
  int number;
  String parentHash;
  Seal seal;
  int timestamp;
  String txsCommit;
  String txsProposal;
  Witness witness;
  int unclesCount;
  String unclesHash;
  int version;

  Header(
      this.cellbaseId,
      this.difficulty,
      this.hash,
      this.number,
      this.parentHash,
      this.seal,
      this.timestamp,
      this.txsCommit,
      this.txsProposal,
      this.witness,
      this.unclesCount,
      this.unclesHash,
      this.version);

  factory Header.fromJson(Map<String, dynamic> json) => Header(
      json['cellbase_id'] as String,
      json['difficulty'] as String,
      json['hash'] as String,
      json['number'] as int,
      json['parent_hash'] as String,
      json['seal'] == null ? null : Seal.fromJson(json['seal'] as Map<String, dynamic>),
      json['timestamp'] as int,
      json['txs_commit'] as String,
      json['txs_proposal'] as String,
      json['witnesses_root'] == null
          ? null
          : Witness.fromJson(json['witnesses_root'] as Map<String, dynamic>),
      json['uncles_count'] as int,
      json['uncles_hash'] as String,
      json['version'] as int);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'cellbase_id': cellbaseId,
        'difficulty': difficulty,
        'hash': hash,
        'number': number,
        'parent_hash': parentHash,
        'seal': seal,
        'timestamp': timestamp,
        'txs_commit': txsCommit,
        'txs_proposal': txsProposal,
        'witnesses_root': witness,
        'uncles_count': unclesCount,
        'uncles_hash': unclesHash,
        'version': version
      };
}

class Seal {
  int nonce;
  String proof;

  Seal(this.nonce, this.proof);

  factory Seal.fromJson(Map<String, dynamic> json) =>
      Seal(json['nonce'] as int, json['proof'] as String);
  Map<String, dynamic> toJson() => <String, dynamic>{'nonce': nonce, 'proof': proof};
}
