import 'package:ckb_sdk/ckb-types/item/transaction.dart';

class TransactionWithStatus {
  TxStatus txStatus;
  Transaction transaction;

  TransactionWithStatus(this.txStatus, this.transaction);

  factory TransactionWithStatus.fromJson(Map<String, dynamic> json) => TransactionWithStatus(
        json['tx_status'] == null ? null : TxStatus.fromJson(json['tx_status']),
        json['transaction'] == null ? null : Transaction.fromJson(json['transaction']),
      );
}

class TxStatus {
  String status;
  String blockHash;

  TxStatus(this.status, this.blockHash);

  factory TxStatus.fromJson(Map<String, dynamic> json) =>
      TxStatus(json['status'] as String, json['block_hash'] as String);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'block_hash': blockHash,
      };
}