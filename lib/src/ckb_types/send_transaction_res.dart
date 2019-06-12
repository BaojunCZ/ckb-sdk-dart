part of 'package:ckb_sdk/ckb_types.dart';

class SendTransactionRes extends RPCResponse<String> {
  SendTransactionRes(id, jsonrpc, result, error) : super(id, jsonrpc, result, error);

  factory SendTransactionRes.fromJson(Map<String, dynamic> json) {
    return SendTransactionRes(
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
