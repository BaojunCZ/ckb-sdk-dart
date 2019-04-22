/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 12:36:14
 * @Description: file content
 */
import 'package:ckb_sdk/ckb-types/item/transaction.dart';
import 'package:ckb_sdk/ckb-types/response.dart';

class TransactionRes extends RPCResponse<Transaction> {
  TransactionRes(id, jsonrpc, result, error)
      : super(id, jsonrpc, result, error);

  factory TransactionRes.fromJson(Map<String, dynamic> json) {
    return TransactionRes(
        json['id'],
        json['jsonrpc'],
        json['result'] == null ? null : Transaction.fromJson(json['result']),
        json['error'] == null ? null : RPCError.fromJson(json['error']));
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'jsonrpc': this.jsonrpc,
        'result': this.result,
        'error': this.error
      };
}
