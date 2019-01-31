/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 15:39:34
 * @Description: file content
 */
import 'package:json_annotation/json_annotation.dart';
part 'header.g.dart';

@JsonSerializable()
class Header {
  @JsonKey(name: 'cellbase_id')
  String cellbaseId;
  String difficulty;
  String hash;
  int number;
  @JsonKey(name: 'parent_hash')
  String parentHash;
  Seal seal;
  int timestamp;
  @JsonKey(name: 'txs_commit')
  String txsCommit;
  @JsonKey(name: 'txs_proposal')
  String txsProposal;
  @JsonKey(name: 'uncles_count')
  int unclesCount;
  @JsonKey(name: 'uncles_hash')
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
      this.unclesCount,
      this.unclesHash,
      this.version);
      
  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
  Map<String, dynamic> toJson() => _$HeaderToJson(this);
}

@JsonSerializable()
class Seal {
  int nonce;
  String proof;

  Seal(this.nonce, this.proof);

  factory Seal.fromJson(Map<String, dynamic> json) => _$SealFromJson(json);
  Map<String, dynamic> toJson() => _$SealToJson(this);
}
