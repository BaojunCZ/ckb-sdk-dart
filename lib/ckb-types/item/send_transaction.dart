/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 12:49:23
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 12:34:20
 * @Description: file content
 */
import 'package:ckb_dart_sdk/ckb-types/item/cell_input.dart';
import 'package:ckb_dart_sdk/ckb-types/item/cell_output.dart';
import 'package:ckb_dart_sdk/ckb-types/item/out_point.dart';
part 'send_transaction.g.dart';

class SendTransaction {
  List<OutPoint> deps;
  List<CellInput> inputs;
  List<CellOutput> outputs;
  int version;

  SendTransaction(this.deps, this.inputs, this.outputs, this.version);

  factory SendTransaction.fromJson(Map<String, dynamic> json) =>
      _$SendTransactionFromJson(json);
  Map<String, dynamic> toJson() => _$SendTransactionToJson(this);
}
