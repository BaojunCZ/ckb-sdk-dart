class TxPoolInfo {
  String pending;
  String staging;
  String orphan;

  TxPoolInfo(this.pending, this.staging, this.orphan);

  factory TxPoolInfo.fromJson(Map<String, dynamic> json) => TxPoolInfo(
        json['pending'] as String,
        json['staging'] as String,
        json['orphan'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pending': pending,
        'staging': staging,
        'orphan': orphan,
      };
}
