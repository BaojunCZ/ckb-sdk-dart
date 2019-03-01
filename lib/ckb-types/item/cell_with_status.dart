/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 11:41:43
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 12:33:45
 * @Description: file content
 */
import 'package:ckb_dart_sdk/ckb-types/item/cell_output.dart';

part 'cell_with_status.g.dart';

class CellWithStatus {
  CellOutput cell;
  String status;

  CellWithStatus(this.cell, this.status);

  factory CellWithStatus.fromJson(Map<String, dynamic> json) =>
      _$CellWithStatusFromJson(json);

  Map<String, dynamic> toJson() => _$CellWithStatusToJson(this);
}
