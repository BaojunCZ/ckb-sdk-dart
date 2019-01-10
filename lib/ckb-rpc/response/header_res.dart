import './response.dart';
import './item/header.dart';

class HeaderRes extends Response<Header> {
  HeaderRes(id, jsonrpc, result, error) : super(id, jsonrpc, result, error);

  factory HeaderRes.fromJson(Map<String, dynamic> json) {
    return HeaderRes(
        json['id'],
        json['jsonrpc'],
        Header.fromJson(json['result']),
        json['error'] == null ? null : Error.fromJson(json['error']));
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'jsonrpc': this.jsonrpc,
        'result': this.result,
        'error': this.error
      };
}
