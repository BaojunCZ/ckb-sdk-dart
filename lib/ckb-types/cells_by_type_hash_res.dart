/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-02-01 16:04:12
 * @Description: file content
 */
import './response.dart';
import './item/cell.dart';

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
