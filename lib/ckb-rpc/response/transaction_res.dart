import './item/transaction.dart';
import './response.dart';

class TransationRes extends Response<Transaction> {
  TransationRes(id, jsonrpc, result, error) : super(id, jsonrpc, result, error);

  factory TransationRes.fromJson(Map<String, dynamic> json) {
    return TransationRes(
        json['id'],
        json['jsonrpc'],
        Transaction.fromJson(json['result']),
        json['error'] == null ? null : Error.fromJson(json['error']));
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'jsonrpc': this.jsonrpc,
        'result': this.result,
        'error': this.error
      };
}
