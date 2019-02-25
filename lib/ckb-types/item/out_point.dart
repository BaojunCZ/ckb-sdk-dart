/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 15:39:37
 * @Description: file content
 */
part 'out_point.g.dart';

class OutPoint {
  String hash;
  int index;

  OutPoint(this.hash, this.index);

  factory OutPoint.fromJson(Map<String, dynamic> json) =>
      _$OutPointFromJson(json);
  Map<String, dynamic> toJson() => _$OutPointToJson(this);
}
