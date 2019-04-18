/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:28:41
 * @Description: file content
 */
import 'package:ckb_sdk/ckb-types/item/script.dart';

class CellOutput {
  String capacity;
  String data;
  Script lock;
  Script type;

  CellOutput(this.capacity, this.data, this.lock, this.type);

  factory CellOutput.fromJson(Map<String, dynamic> json) => CellOutput(
      json['capacity'] as String,
      json['data'] as String,
      json['lock'] == null
          ? null
          : Script.fromJson(json['lock'] as Map<String, dynamic>),
      json['type'] == null
          ? null
          : Script.fromJson(json['unlock'] as Map<String, dynamic>));

  Map<String, dynamic> toJson() => <String, dynamic>{
        'capacity': capacity,
        'data': data,
        'lock': lock,
        'type': type
      };
}
