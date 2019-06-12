part of 'package:ckb_sdk/ckb_types.dart';

class TipBlockNumberRes extends RPCResponse<String> {
  TipBlockNumberRes(id, jsonrpc, result, error) : super(id, jsonrpc, result, error);

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
