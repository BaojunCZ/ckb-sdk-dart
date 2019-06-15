part of 'package:ckb_sdk/ckb_types.dart';

class PeersRes extends RPCResponse<List<NodeInfo>> {
  PeersRes(id, jsonrpc, result, error) : super(id, jsonrpc, result, error);

  factory PeersRes.fromJson(Map<String, dynamic> json) {
    return PeersRes(
        json['id'],
        json['jsonrpc'],
        json['result'] == null
            ? null
            : (json['result'] as List)
                ?.map((e) => e == null ? null : NodeInfo.fromJson(e as Map<String, dynamic>))
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
