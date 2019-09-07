part of 'package:ckb_sdk/ckb_types.dart';

class OutPoint {
  String txHash;
  String index;

  OutPoint(this.txHash, this.index);

  factory OutPoint.fromJson(Map<String, dynamic> json) =>
      OutPoint(json['tx_hash'] as String, json['index'] as String);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'tx_hash': txHash, 'index': index};
}
