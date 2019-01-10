import './response.dart';

class BlockHashRes extends Response<String> {
  BlockHashRes(id, jsonrpc, result, error) : super(id, jsonrpc, result, error);
  getBlockHash() {
    return result;
  }

  factory BlockHashRes.fromJson(Map<String, dynamic> json) {
    return BlockHashRes(json['id'], json['jsonrpc'], json['result'],
        json['error'] == null ? null : Error.fromJson(json['error']));
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'jsonrpc': this.jsonrpc,
        'result': this.result,
        'error': this.error
      };
}
