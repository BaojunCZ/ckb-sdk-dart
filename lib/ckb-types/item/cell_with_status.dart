/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 11:41:43
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:29:19
 * @Description: file content
 */
import 'package:ckb_sdk/ckb-types/item/cell_output.dart';

class CellWithStatus {
  static String LIVE = 'live';
  static String DEAD = 'dead';

  CellOutput cell;
  String status;

  CellWithStatus(this.cell, this.status);

  factory CellWithStatus.fromJson(Map<String, dynamic> json) => CellWithStatus(
      json['cell'] == null ? null : CellOutput.fromJson(json['cell'] as Map<String, dynamic>),
      json['status'] as String);

  Map<String, dynamic> toJson() => <String, dynamic>{'cell': cell, 'status': status};
}
