part of 'package:ckb_sdk/ckb_types.dart';

class DryRunTransactionRes extends RPCResponse<Cycles> {
  DryRunTransactionRes(int id, String jsonrpc, Cycles result, RPCError error)
      : super(id, jsonrpc, result, error);

  factory DryRunTransactionRes.fromJson(Map<String, dynamic> json) => DryRunTransactionRes(
      json['id'],
      json['jsonrpc'],
      json['result'] == null ? null : Cycles.fromJson(json['result']),
      json['error'] == null ? null : RPCError.fromJson(json['error']));
}
