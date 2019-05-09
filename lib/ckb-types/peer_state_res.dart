import 'package:ckb_sdk/ckb-types/item/peer_state.dart';
import 'package:ckb_sdk/ckb-types/response.dart';

class PeerStateRes extends RPCResponse<List<PeerState>> {
  PeerStateRes(int id, String jsonrpc, List<PeerState> result, RPCError error) : super(id, jsonrpc, result, error);

  factory PeerStateRes.fromJson(Map<String, dynamic> json) {
    return PeerStateRes(
        json['id'],
        json['jsonrpc'],
        json['result'] == null
            ? null
            : json['result'] == null
                ? null
                : (json['result'] as List)
                    ?.map((e) => e == null ? null : PeerState.fromJson(e as Map<String, dynamic>))
                    ?.toList(),
        json['error'] == null ? null : RPCError.fromJson(json['error']));
  }
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': this.id, 'jsonrpc': this.jsonrpc, 'result': this.result, 'error': this.error};
}
