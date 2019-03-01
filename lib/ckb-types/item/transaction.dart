/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 12:34:28
 * @Description: file content
 */
import "package:ckb_dart_sdk/ckb-types/item/out_point.dart";
import 'package:ckb_dart_sdk/ckb-types/item/cell_input.dart';
import 'package:ckb_dart_sdk/ckb-types/item/cell_output.dart';
part 'transaction.g.dart';

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
