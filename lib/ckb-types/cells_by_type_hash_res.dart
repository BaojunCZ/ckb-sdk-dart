/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 12:35:39
 * @Description: file content
 */
import 'package:ckb_dart_sdk/ckb-types/response.dart';
import 'package:ckb_dart_sdk/ckb-types/item/cell.dart';

class CellsByTypeHashRes extends RPCResponse<List<Cell>> {
  CellsByTypeHashRes(id, jsonrpc, result, error)
      : super(id, jsonrpc, result, error);

  factory CellsByTypeHashRes.fromJson(Map<String, dynamic> json) {
    return CellsByTypeHashRes(
        json['id'],
        json['jsonrpc'],
        json['result'] == null
            ? null
            : (json['result'] as List)
                ?.map((e) =>
                    e == null ? null : Cell.fromJson(e as Map<String, dynamic>))
                ?.toList(),
        json['error'] == null ? null : RPCError.fromJson(json['error']));
  }
}
