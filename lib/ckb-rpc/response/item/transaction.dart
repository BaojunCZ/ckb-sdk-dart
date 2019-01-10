import './cell_input.dart';
import './cell_output.dart';
import './out_point.dart';
import 'package:json_annotation/json_annotation.dart';
part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  List<OutPoint> deps;
  String hash;
  List<CellInput> inputs;
  List<CellOutput> outputs;
  int version;

  Transaction(this.deps, this.hash, this.inputs, this.outputs, this.version);

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
