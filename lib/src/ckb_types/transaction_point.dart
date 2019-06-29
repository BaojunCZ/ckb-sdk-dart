part of 'package:ckb_sdk/ckb_types.dart';

class TransactionPoint {
  String blockNumber;
  String index;
  String txHash;

  TransactionPoint(this.blockNumber, this.index, this.txHash);

  factory TransactionPoint.fromJson(Map<String, dynamic> json) => TransactionPoint(
        json['block_number'] as String,
        json['index'] as String,
        json['tx_hash'] as String,
      );

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'block_number': blockNumber, 'index': index, 'tx_hash': txHash};
}
