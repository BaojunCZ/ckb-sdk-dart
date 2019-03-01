/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 12:33:50
 * @Description: file content
 */
import 'package:ckb_dart_sdk/ckb-types/item/out_point.dart';

part 'cell.g.dart';

class Cell {
  int capacity;
  String lock;
  OutPoint outPoint;

  Cell(this.capacity, this.lock, this.outPoint);

  factory Cell.fromJson(Map<String, dynamic> json) => _$CellFromJson(json);
  Map<String, dynamic> toJson() => _$CellToJson(this);
}
