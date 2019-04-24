/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 12:35:39
 * @Description: file content
 */
import 'package:ckb_sdk/ckb-types/item/cell_with_outpoint.dart';
import 'package:ckb_sdk/ckb-types/response.dart';

class CellsByLockHashRes extends RPCResponse<List<CellWithOutPoint>> {
  CellsByLockHashRes(id, jsonrpc, result, error) : super(id, jsonrpc, result, error);

  factory CellsByLockHashRes.fromJson(Map<String, dynamic> json) {
    return CellsByLockHashRes(
        json['id'],
        json['jsonrpc'],
        json['result'] == null
            ? null
            : (json['result'] as List)
                ?.map((e) => e == null ? null : CellWithOutPoint.fromJson(e as Map<String, dynamic>))
                ?.toList(),
        json['error'] == null ? null : RPCError.fromJson(json['error']));
  }
}
