/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 12:33:39
 * @Description: file content
 */
import 'package:ckb_dart_sdk/ckb-types/item/unlock.dart';
part 'cell_output.g.dart';

class CellOutput {
  int capacity;
  String data;
  String lock;
  Unlock type;

  CellOutput(this.capacity, this.data, this.lock, this.type);

  factory CellOutput.fromJson(Map<String, dynamic> json) =>
      _$CellOutputFromJson(json);
  Map<String, dynamic> toJson() => _$CellOutputToJson(this);
}
