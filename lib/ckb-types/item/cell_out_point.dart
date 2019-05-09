class CellOutPoint {
  String txHash;
  int index;

  CellOutPoint(this.txHash, this.index);

  factory CellOutPoint.fromJson(Map<String, dynamic> json) =>
      CellOutPoint(json['tx_hash'] as String, json['index'] as int);
  Map<String, dynamic> toJson() => <String, dynamic>{'tx_hash': txHash, 'index': index};
}
