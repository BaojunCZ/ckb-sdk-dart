part of 'package:ckb_sdk/ckb_types.dart';

class LocalNodeInfoRes extends RPCResponse<NodeInfo> {
  LocalNodeInfoRes(id, jsonrpc, result, error) : super(id, jsonrpc, result, error);

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
