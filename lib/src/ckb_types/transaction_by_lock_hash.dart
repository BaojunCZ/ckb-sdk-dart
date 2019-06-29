part of 'package:ckb_sdk/ckb_types.dart';

class TransactionByLockHash {
  TransactionPoint consumedBy;
  TransactionPoint createBy;

  TransactionByLockHash(this.consumedBy, this.createBy);

  factory TransactionByLockHash.fromJson(Map<String, dynamic> json) => TransactionByLockHash(
        json['consumed_by'] == null ? null : TransactionPoint.fromJson(json['consumed_by']),
        json['created_by'] == null ? null : TransactionPoint.fromJson(json['created_by']),
      );

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'consumed_by': consumedBy, 'create_by': createBy};
}
