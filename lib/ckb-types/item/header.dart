/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 12:34:01
 * @Description: file content
 */
part 'package:ckb_dart_sdk/ckb-types/item/header.g.dart';

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
      this.unclesCount,
      this.unclesHash,
      this.version);
      
  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
  Map<String, dynamic> toJson() => _$HeaderToJson(this);
}

class Seal {
  int nonce;
  String proof;

  Seal(this.nonce, this.proof);

  factory Seal.fromJson(Map<String, dynamic> json) => _$SealFromJson(json);
  Map<String, dynamic> toJson() => _$SealToJson(this);
}
