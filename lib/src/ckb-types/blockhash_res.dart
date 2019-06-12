part of 'package:ckb_sdk/ckb_types.dart';

class BlockHashRes extends RPCResponse<String> {
  BlockHashRes(id, jsonrpc, result, error) : super(id, jsonrpc, result, error);

  factory BlockHashRes.fromJson(Map<String, dynamic> json) {
    return BlockHashRes(json['id'], json['jsonrpc'], json['result'] == null ? null : json['result'],
        json['error'] == null ? null : RPCError.fromJson(json['error']));
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'jsonrpc': this.jsonrpc,
        'result': this.result,
        'error': this.error
      };
}
