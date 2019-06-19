/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:32:18
 * @Description: file content
 */
part of 'package:ckb_sdk/ckb_types.dart';

class OutPoint {
  String blockHash;
  CellOutPoint cell;

  OutPoint(this.blockHash, this.cell);

  factory OutPoint.fromJson(Map<String, dynamic> json) => OutPoint(json['block_hash'] as String,
      json['cell'] == null ? null : CellOutPoint.fromJson(json['cell']));
  Map<String, dynamic> toJson() => <String, dynamic>{'block_hash': blockHash, 'cell': cell};
}
