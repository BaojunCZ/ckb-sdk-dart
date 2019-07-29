part of 'package:ckb_sdk/ckb_types.dart';

class Header {
  String dao;
  String difficulty;
  String hash;
  String number;
  String epoch;
  String parentHash;
  Seal seal;
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
      this.number,
      this.epoch,
      this.parentHash,
      this.seal,
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
      json['number'] as String,
      json['epoch'] as String,
      json['parent_hash'] as String,
      json['seal'] == null ? null : Seal.fromJson(json['seal'] as Map<String, dynamic>),
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
        'number': number,
        'epoch': epoch,
        'parent_hash': parentHash,
        'seal': seal.toJson(),
        'timestamp': timestamp,
        'transactions_root': transactionsRoot,
        'proposals_hash': proposalsHash,
        'witnesses_root': witnessesRoot,
        'uncles_count': unclesCount,
        'uncles_hash': unclesHash,
        'version': version
      };
}

class Seal {
  String nonce;
  String proof;

  Seal(this.nonce, this.proof);

  factory Seal.fromJson(Map<String, dynamic> json) =>
      Seal(json['nonce'] as String, json['proof'] as String);

  Map<String, dynamic> toJson() => <String, dynamic>{'nonce': nonce, 'proof': proof};
}
