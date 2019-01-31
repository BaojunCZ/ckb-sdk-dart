/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 17:11:16
 * @Description: file content
 */
import './response.dart';
import './item/cell.dart';

class CellsByTypeHash extends RPCResponse<List<Cell>> {
  CellsByTypeHash(id, jsonrpc, result, error)
      : super(id, jsonrpc, result, error);

  factory CellsByTypeHash.fromJson(Map<String, dynamic> json) {
    return CellsByTypeHash(
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
