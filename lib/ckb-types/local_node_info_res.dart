/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 11:53:24
 * @LastEditors: your name
 * @LastEditTime: 2019-02-19 11:37:02
 * @Description: file content
 */
import './response.dart';
import './item/node_info.dart';

class LocalNodeInfoRes extends RPCResponse<NodeInfo> {
  LocalNodeInfoRes(id, jsonrpc, result, error)
      : super(id, jsonrpc, result, error);

  factory LocalNodeInfoRes.fromJson(Map<String, dynamic> json) {
    return LocalNodeInfoRes(
        json['id'],
        json['jsonrpc'],
        json['result'] == null ? null : NodeInfo.fromJson(json['result']),
        json['error'] == null ? null : RPCError.fromJson(json['error']));
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'jsonrpc': this.jsonrpc,
        'result': this.result,
        'error': this.error
      };
}
