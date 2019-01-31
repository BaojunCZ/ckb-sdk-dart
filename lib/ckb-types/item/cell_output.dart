/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 15:39:22
 * @Description: file content
 */
import 'package:json_annotation/json_annotation.dart';
part 'cell_output.g.dart';

@JsonSerializable()
class CellOutput {
  int capacity;
  String data;
  String lock;
  dynamic type;

  CellOutput(this.capacity, this.data, this.lock, this.type);

  factory CellOutput.fromJson(Map<String, dynamic> json) =>
      _$CellOutputFromJson(json);
  Map<String, dynamic> toJson() => _$CellOutputToJson(this);
}
