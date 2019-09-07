part of 'package:ckb_sdk/ckb_types.dart';

class Header {
  String dao;
  String difficulty;
  String hash;
  String nonce;
  String number;
  String epoch;
  String parentHash;
  String timestamp;
  String transactionsRoot;
  String proposalsHash;
  String witnessesRoot;
  String unclesCount;
  String unclesHash;
  String version;

  Header(
      this.difficulty,
      this.hash,
      this.nonce,
      this.number,
      this.epoch,
      this.parentHash,
      this.timestamp,
      this.transactionsRoot,
      this.proposalsHash,
      this.witnessesRoot,
      this.unclesCount,
      this.unclesHash,
      this.version);

  factory Header.fromJson(Map<String, dynamic> json) => Header(
      json['difficulty'] as String,
      json['hash'] as String,
      json['nonce'] as String,
      json['number'] as String,
      json['epoch'] as String,
      json['parent_hash'] as String,
      json['timestamp'] as String,
      json['transactions_root'] as String,
      json['proposals_hash'] as String,
      json['witnesses_root'] as String,
      json['uncles_count'] as String,
      json['uncles_hash'] as String,
      json['version'] as String);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'difficulty': difficulty,
        'hash': hash,
        'nonce':nonce,
        'number': number,
        'epoch': epoch,
        'parent_hash': parentHash,
        'timestamp': timestamp,
        'transactions_root': transactionsRoot,
        'proposals_hash': proposalsHash,
        'witnesses_root': witnessesRoot,
        'uncles_count': unclesCount,
        'uncles_hash': unclesHash,
        'version': version
      };
}
