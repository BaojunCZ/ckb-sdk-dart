part of 'package:ckb_sdk/ckb_types.dart';

class TxPoolInfo {
  String pending;
  String staging;
  String orphan;
  String lastTxsUpdatedAt;
  String totalTxCycles;
  String totalTxSize;

  TxPoolInfo(this.pending, this.staging, this.orphan, this.lastTxsUpdatedAt, this.totalTxCycles,
      this.totalTxSize);

  factory TxPoolInfo.fromJson(Map<String, dynamic> json) => TxPoolInfo(
        json['pending'] as String,
        json['staging'] as String,
        json['orphan'] as String,
        json['last_txs_updated_at'] as String,
        json['total_tx_cycles'] as String,
        json['total_tx_size'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pending': pending,
        'staging': staging,
        'orphan': orphan,
        'last_txs_updated_at': lastTxsUpdatedAt,
        'total_tx_cycles': totalTxCycles,
        'total_tx_size': totalTxSize,
      };
}
