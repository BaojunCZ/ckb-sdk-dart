/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 15:39:27
 * @Description: file content
 */
import 'package:json_annotation/json_annotation.dart';
import './out_point.dart';

part 'cell.g.dart';

@JsonSerializable()
class Cell {
  int capacity;
  String lock;
  @JsonKey(name: 'out_point')
  OutPoint outPoint;

  Cell(this.capacity, this.lock, this.outPoint);

  factory Cell.fromJson(Map<String, dynamic> json) => _$CellFromJson(json);
  Map<String, dynamic> toJson() => _$CellToJson(this);
}
