/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 11:41:43
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 15:39:24
 * @Description: file content
 */
import './cell_output.dart';

part 'cell_with_status.g.dart';

class CellWithStatus {
  CellOutput cell;
  String status;

  CellWithStatus(this.cell, this.status);

  factory CellWithStatus.fromJson(Map<String, dynamic> json) =>
      _$CellWithStatusFromJson(json);

  Map<String, dynamic> toJson() => _$CellWithStatusToJson(this);
}
