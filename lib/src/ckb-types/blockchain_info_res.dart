part of 'package:ckb_sdk/ckb_types.dart';

class BlockchainIfnoRes extends RPCResponse<BlockchainInfo> {
  BlockchainIfnoRes(int id, String jsonrpc, BlockchainInfo result, RPCError error)
      : super(id, jsonrpc, result, error);

  factory BlockchainIfnoRes.fromJson(Map<String, dynamic> json) {
    return BlockchainIfnoRes(
        json['id'],
        json['jsonrpc'],
        json['result'] == null ? null : BlockchainInfo.fromJson(json['result']),
        json['error'] == null ? null : RPCError.fromJson(json['error']));
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'jsonrpc': this.jsonrpc,
        'result': this.result,
        'error': this.error
      };
}
