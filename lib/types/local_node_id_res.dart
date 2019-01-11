/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 11:53:24
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 17:12:10
 * @Description: file content
 */
import './response.dart';

class LocalNodeIdRes extends RPCResponse<String> {
  LocalNodeIdRes(id, jsonrpc, result, error)
      : super(id, jsonrpc, result, error);

  factory LocalNodeIdRes.fromJson(Map<String, dynamic> json) {
    return LocalNodeIdRes(
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
