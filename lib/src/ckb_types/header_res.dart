/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 12:35:42
 * @Description: file content
 */
part of 'package:ckb_sdk/ckb_types.dart';

class HeaderRes extends RPCResponse<Header> {
  HeaderRes(id, jsonrpc, result, error) : super(id, jsonrpc, result, error);

  factory HeaderRes.fromJson(Map<String, dynamic> json) {
    return HeaderRes(
        json['id'],
        json['jsonrpc'],
        json['result'] == null ? null : Header.fromJson(json['result']),
        json['error'] == null ? null : RPCError.fromJson(json['error']));
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'jsonrpc': this.jsonrpc,
        'result': this.result,
        'error': this.error
      };
}
