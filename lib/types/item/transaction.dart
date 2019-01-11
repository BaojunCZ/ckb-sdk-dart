/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 16:33:49
 * @Description: file content
 */
import 'package:json_annotation/json_annotation.dart';
import "./out_point.dart";
import './cell_input.dart';
import './cell_output.dart';
part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  String hash;
  List<OutPoint> deps;
  List<CellInput> inputs;
  List<CellOutput> outputs;
  int version;

  Transaction(this.deps, this.hash, this.inputs, this.outputs, this.version);

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
