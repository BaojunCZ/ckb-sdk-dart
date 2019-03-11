/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:30:28
 * @Description: file content
 */
import 'package:ckb_sdk/ckb-types/item/out_point.dart';

class Cell {
  int capacity;
  String lock;
  OutPoint outPoint;

  Cell(this.capacity, this.lock, this.outPoint);

  factory Cell.fromJson(Map<String, dynamic> json) => Cell(
      json['capacity'] as int,
      json['lock'] as String,
      json['out_point'] == null
          ? null
          : OutPoint.fromJson(json['out_point'] as Map<String, dynamic>));

  Map<String, dynamic> toJson() => <String, dynamic>{
        'capacity': capacity,
        'lock': lock,
        'out_point': outPoint
      };
}
