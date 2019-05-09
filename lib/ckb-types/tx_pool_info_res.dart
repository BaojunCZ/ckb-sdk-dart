import 'package:ckb_sdk/ckb-types/item/tx_pool_info.dart';
import 'package:ckb_sdk/ckb-types/response.dart';

class TxPoolInfoRes extends RPCResponse<TxPoolInfo> {
  TxPoolInfoRes(id, jsonrpc, result, error) : super(id, jsonrpc, result, error);

  factory TxPoolInfoRes.fromJson(Map<String, dynamic> json) {
    return TxPoolInfoRes(
        json['id'],
        json['jsonrpc'],
        json['result'] == null ? null : TxPoolInfo.fromJson(json['result']),
        json['error'] == null ? null : RPCError.fromJson(json['error']));
  }
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': this.id, 'jsonrpc': this.jsonrpc, 'result': this.result, 'error': this.error};
}
