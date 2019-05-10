/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 12:49:23
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:32:49
 * @Description: file content
 */
import 'package:ckb_sdk/ckb-types/item/cell_output.dart';
import 'package:ckb_sdk/ckb-types/item/out_point.dart';

class SendTransaction {
  List<OutPoint> deps;
  List<SendCellInput> inputs;
  List<CellOutput> outputs;
  int version;

  SendTransaction(this.version, this.deps, this.inputs, this.outputs);

  factory SendTransaction.fromJson(Map<String, dynamic> json) => SendTransaction(
        json['version'] as int,
        (json['deps'] as List)
            ?.map((e) => e == null ? null : OutPoint.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        (json['inputs'] as List)
            ?.map((e) => e == null ? null : SendCellInput.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        (json['outputs'] as List)
            ?.map((e) => e == null ? null : CellOutput.fromJson(e as Map<String, dynamic>))
            ?.toList(),
      );

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'version': version, 'deps': deps, 'inputs': inputs, 'outputs': outputs};
}

class SendCellInput {
  OutPoint previousOutput;
  List<String> args;

  SendCellInput(this.previousOutput, this.args);

  factory SendCellInput.fromJson(Map<String, dynamic> json) => SendCellInput(
      json['previous_output'] == null
          ? null
          : OutPoint.fromJson(json['previous_output'] as Map<String, dynamic>),
      (json['args'] as List)?.map((e) => e as String)?.toList());

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'previous_output': previousOutput.toJson(), 'args': args};
}
