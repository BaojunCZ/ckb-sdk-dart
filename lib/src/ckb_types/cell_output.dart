part of 'package:ckb_sdk/ckb_types.dart';

class CellOutput {
  String capacity;
  String dataHash;
  Script lock;
  Script type;

  CellOutput(this.capacity, this.dataHash, this.lock, this.type);

  factory CellOutput.fromJson(Map<String, dynamic> json) => CellOutput(
      json['capacity'] as String,
      json['data_hash'] as String,
      json['lock'] == null ? null : Script.fromJson(json['lock'] as Map<String, dynamic>),
      json['type'] == null ? null : Script.fromJson(json['type'] as Map<String, dynamic>));

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'capacity': capacity, 'data_hash': dataHash, 'lock': lock, 'type': type};
}
