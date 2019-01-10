import './response.dart';
import './item/cell.dart';

class CellsByTypeHash extends Response<List<Cell>> {
  CellsByTypeHash(id, jsonrpc, result, error)
      : super(id, jsonrpc, result, error);

  factory CellsByTypeHash.fromJson(Map<String, dynamic> json) {
    return CellsByTypeHash(
        json['id'],
        json['jsonrpc'],
        (json['result'] as List)
            ?.map((e) =>
                e == null ? null : Cell.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        json['error'] == null ? null : Error.fromJson(json['error']));
  }
}
