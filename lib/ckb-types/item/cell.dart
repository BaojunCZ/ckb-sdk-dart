/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 15:39:27
 * @Description: file content
 */
import './out_point.dart';

part 'cell.g.dart';

class Cell {
  int capacity;
  String lock;
  OutPoint outPoint;

  Cell(this.capacity, this.lock, this.outPoint);

  factory Cell.fromJson(Map<String, dynamic> json) => _$CellFromJson(json);
  Map<String, dynamic> toJson() => _$CellToJson(this);
}
