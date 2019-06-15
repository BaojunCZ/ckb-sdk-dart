part of 'package:ckb_sdk/ckb_types.dart';

class RPCResponse<T> {
  int id;
  String jsonrpc;
  T result;
  RPCError error;

  RPCResponse(this.id, this.jsonrpc, this.result, this.error);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'jsonrpc': this.jsonrpc,
        'result': this.result,
        'error': this.error
      };
}
