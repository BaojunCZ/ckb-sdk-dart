class CellOutPoint {
  String txHash;
  String index;

  CellOutPoint(this.txHash, this.index);

  factory CellOutPoint.fromJson(Map<String, dynamic> json) =>
      CellOutPoint(json['tx_hash'] as String, json['index'] as String);
  Map<String, dynamic> toJson() => <String, dynamic>{'tx_hash': txHash, 'index': index};
}
