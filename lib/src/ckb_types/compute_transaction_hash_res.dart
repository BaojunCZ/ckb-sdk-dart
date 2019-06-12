part of 'package:ckb_sdk/ckb_types.dart';

class ComputeTransactionHashRes extends RPCResponse<String> {
  ComputeTransactionHashRes(int id, String jsonrpc, String result, RPCError error)
      : super(id, jsonrpc, result, error);

  factory ComputeTransactionHashRes.fromJson(Map<String, dynamic> json) {
    return ComputeTransactionHashRes(
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
