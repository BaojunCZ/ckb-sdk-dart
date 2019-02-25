/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 12:49:23
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 15:39:39
 * @Description: file content
 */
import './cell_input.dart';
import './cell_output.dart';
import './out_point.dart';
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
