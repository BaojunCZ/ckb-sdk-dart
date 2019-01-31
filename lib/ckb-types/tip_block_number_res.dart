/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 11:50:01
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 17:12:28
 * @Description: file content
 */
import './response.dart';

class TipBlockNumberRes extends RPCResponse<int> {
  TipBlockNumberRes(id, jsonrpc, result, error)
      : super(id, jsonrpc, result, error);

  factory TipBlockNumberRes.fromJson(Map<String, dynamic> json) {
    return TipBlockNumberRes(
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
