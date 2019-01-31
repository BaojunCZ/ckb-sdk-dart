/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 18:06:39
 * @Description: file content
 */
import './item/transaction.dart';
import './response.dart';

class TransationRes extends RPCResponse<Transaction> {
  TransationRes(id, jsonrpc, result, error) : super(id, jsonrpc, result, error);

  factory TransationRes.fromJson(Map<String, dynamic> json) {
    return TransationRes(
        json['id'],
        json['jsonrpc'],
        json['result'] == null ? null : Transaction.fromJson(json['result']),
        json['error'] == null ? null : RPCError.fromJson(json['error']));
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'jsonrpc': this.jsonrpc,
        'result': this.result,
        'error': this.error.toJson()
      };
}
