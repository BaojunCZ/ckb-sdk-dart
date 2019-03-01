/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 12:34:12
 * @Description: file content
 */
part 'package:ckb_dart_sdk/ckb-types/item/out_point.g.dart';

class OutPoint {
  String hash;
  int index;

  OutPoint(this.hash, this.index);

  factory OutPoint.fromJson(Map<String, dynamic> json) =>
      _$OutPointFromJson(json);
  Map<String, dynamic> toJson() => _$OutPointToJson(this);
}
