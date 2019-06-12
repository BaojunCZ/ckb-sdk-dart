part of 'package:ckb_sdk/ckb_types.dart';

class TransactionRes extends RPCResponse<TransactionWithStatus> {
  TransactionRes(id, jsonrpc, result, error) : super(id, jsonrpc, result, error);

  factory TransactionRes.fromJson(Map<String, dynamic> json) {
    return TransactionRes(
        json['id'],
        json['jsonrpc'],
        json['result'] == null ? null : TransactionWithStatus.fromJson(json['result']),
        json['error'] == null ? null : RPCError.fromJson(json['error']));
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'jsonrpc': this.jsonrpc,
        'result': this.result,
        'error': this.error
      };
}
