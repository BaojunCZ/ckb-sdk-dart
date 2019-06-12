/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:30:28
 * @Description: file content
 */
part of 'package:ckb_sdk/ckb_types.dart';

class CellWithOutPoint {
  String capacity;
  Script lock;
  OutPoint outPoint;

  CellWithOutPoint(this.capacity, this.lock, this.outPoint);

  factory CellWithOutPoint.fromJson(Map<String, dynamic> json) => CellWithOutPoint(
      json['capacity'] as String,
      json['lock'] == null ? null : Script.fromJson(json['lock']),
      json['out_point'] == null
          ? null
          : OutPoint.fromJson(json['out_point'] as Map<String, dynamic>));

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'capacity': capacity, 'lock': lock, 'out_point': outPoint};
}
