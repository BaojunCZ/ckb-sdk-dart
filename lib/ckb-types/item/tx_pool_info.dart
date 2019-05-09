class TxPoolInfo {
  int pending;
  int staging;
  int orphan;

  TxPoolInfo(this.pending, this.staging, this.orphan);

  factory TxPoolInfo.fromJson(Map<String, dynamic> json) => TxPoolInfo(
        json['pending'] as int,
        json['staging'] as int,
        json['orphan'] as int,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pending': pending,
        'staging': staging,
        'orphan': orphan,
      };
}
