part of 'package:ckb_sdk/ckb_types.dart';

class LiveCellRes extends RPCResponse<CellWithStatus> {
  LiveCellRes(id, jsonrpc, result, error) : super(id, jsonrpc, result, error);

  factory LiveCellRes.fromJson(Map<String, dynamic> json) {
    return LiveCellRes(
        json['id'],
        json['jsonrpc'],
        json['result'] == null ? null : CellWithStatus.fromJson(json['result']),
        json['error'] == null ? null : RPCError.fromJson(json['error']));
  }
}
