part of 'package:ckb_sdk/ckb_types.dart';

class LockHashIndexStates {
  String blockHash;
  String blockNumber;
  String lockHash;

  LockHashIndexStates(this.blockHash, this.blockNumber, this.lockHash);

  factory LockHashIndexStates.fromJson(Map<String, dynamic> json) => LockHashIndexStates(
        json['block_hash'] as String,
        json['block_number'] as String,
        json['lock_hash'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'block_hash': blockHash,
        'block_number': blockNumber,
        'lock_hash': lockHash,
      };
}
