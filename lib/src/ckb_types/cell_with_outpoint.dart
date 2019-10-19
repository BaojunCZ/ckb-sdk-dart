part of 'package:ckb_sdk/ckb_types.dart';

class CellWithOutPoint {
  String capacity;
  Script lock;
  String blcokHash;

  CellWithOutPoint(this.capacity, this.lock, this.blcokHash);

  factory CellWithOutPoint.fromJson(Map<String, dynamic> json) =>
      CellWithOutPoint(
          json['capacity'] as String,
          json['lock'] == null ? null : Script.fromJson(json['lock']),
          json['block_hash'] as String);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'capacity': capacity,
        'lock': lock,
        'block_hash': blcokHash
      };
}
