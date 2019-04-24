/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:31:46
 * @Description: file content
 */
class Header {
  String cellbaseId;
  String difficulty;
  String hash;
  String number;
  String parentHash;
  Seal seal;
  String timestamp;
  String transactionsRoot;
  String proposalsRoot;
  String witnessesRoot;
  int unclesCount;
  String unclesHash;
  int version;

  Header(this.cellbaseId, this.difficulty, this.hash, this.number, this.parentHash, this.seal, this.timestamp,
      this.transactionsRoot, this.proposalsRoot, this.witnessesRoot, this.unclesCount, this.unclesHash, this.version);

  factory Header.fromJson(Map<String, dynamic> json) => Header(
      json['cellbase_id'] as String,
      json['difficulty'] as String,
      json['hash'] as String,
      json['number'] as String,
      json['parent_hash'] as String,
      json['seal'] == null ? null : Seal.fromJson(json['seal'] as Map<String, dynamic>),
      json['timestamp'] as String,
      json['transactions_root'] as String,
      json['proposals_root'] as String,
      json['witnesses_root'] as String,
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
        'transactions_root': transactionsRoot,
        'proposals_root': proposalsRoot,
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

  factory Seal.fromJson(Map<String, dynamic> json) => Seal(json['nonce'] as String, json['proof'] as String);
  Map<String, dynamic> toJson() => <String, dynamic>{'nonce': nonce, 'proof': proof};
}
