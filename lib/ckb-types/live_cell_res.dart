/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 11:26:27
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 12:35:47
 * @Description: file content
 */
import 'package:ckb_sdk/ckb-types/response.dart';
import 'package:ckb_sdk/ckb-types/item/cell_with_status.dart';

class LiveCellRes extends RPCResponse<CellWithStatus> {
  LiveCellRes(id, jsonrpc, result, error) : super(id, jsonrpc, result, error);

  factory LiveCellRes.fromJson(Map<String, dynamic> json) {
    return LiveCellRes(
        json['id'],
        json['jsonrpc'],
        json['result'] == null ? null : CellWithStatus.fromJson(json['result']),
        json['error'] == null ? null : RPCError.fromJson(json['error']));
  }
}
