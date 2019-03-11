/*
 * @Author: BaojunCZ
 * @Date: 2019-03-8 11:56:20
 * @LastEditors: your name
 * @LastEditTime: 2019-03-08 14:36:08
 * @Description: file content
 */
import 'package:ckb_sdk/ckb-types/response.dart';
import 'package:ckb_sdk/ckb-types/item/trace_transaction.dart';

class TraceTransactionRes extends RPCResponse<List<TraceTransaction>> {
  TraceTransactionRes(id, jsonrpc, result, error)
      : super(id, jsonrpc, result, error);

  factory TraceTransactionRes.fromJson(Map<String, dynamic> json) {
    return TraceTransactionRes(
        json['id'],
        json['jsonrpc'],
        json['result'] == null
            ? null
            : (json['result'] as List)
                ?.map((e) => e == null
                    ? null
                    : TraceTransaction.fromJson(e as Map<String, dynamic>))
                ?.toList(),
        json['error'] == null ? null : RPCError.fromJson(json['error']));
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'jsonrpc': this.jsonrpc,
        'result': this.result,
        'error': this.error
      };
}
