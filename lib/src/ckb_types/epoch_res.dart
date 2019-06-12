part of 'package:ckb_sdk/ckb_types.dart';

class EpochRes extends RPCResponse<Epoch> {
  EpochRes(id, jsonrpc, result, error) : super(id, jsonrpc, result, error);

  factory EpochRes.fromJson(Map<String, dynamic> json) {
    return EpochRes(
        json['id'],
        json['jsonrpc'],
        json['result'] == null ? null : Epoch.fromJson(json['result']),
        json['error'] == null ? null : RPCError.fromJson(json['error']));
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'jsonrpc': this.jsonrpc,
        'result': this.result,
        'error': this.error
      };
}
