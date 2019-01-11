/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 11:56:20
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 17:12:24
 * @Description: file content
 */
import './response.dart';

class SendTransactionRes extends RPCResponse<String> {
  SendTransactionRes(id, jsonrpc, result, error)
      : super(id, jsonrpc, result, error);

  factory SendTransactionRes.fromJson(Map<String, dynamic> json) {
    return SendTransactionRes(
        json['id'],
        json['jsonrpc'],
        json['result'] == null ? null : json['result'],
        json['error'] == null ? null : RPCError.fromJson(json['error']));
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'jsonrpc': this.jsonrpc,
        'result': this.result,
        'error': this.error
      };
}
