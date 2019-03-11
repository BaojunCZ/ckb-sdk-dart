/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 12:49:23
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:32:49
 * @Description: file content
 */
import 'package:ckb_sdk/ckb-types/item/cell_input.dart';
import 'package:ckb_sdk/ckb-types/item/cell_output.dart';
import 'package:ckb_sdk/ckb-types/item/out_point.dart';

class SendTransaction {
  List<OutPoint> deps;
  List<CellInput> inputs;
  List<CellOutput> outputs;
  int version;

  SendTransaction(this.deps, this.inputs, this.outputs, this.version);

  factory SendTransaction.fromJson(Map<String, dynamic> json) =>
      SendTransaction(
          (json['deps'] as List)
              ?.map((e) => e == null
                  ? null
                  : OutPoint.fromJson(e as Map<String, dynamic>))
              ?.toList(),
          (json['inputs'] as List)
              ?.map((e) => e == null
                  ? null
                  : CellInput.fromJson(e as Map<String, dynamic>))
              ?.toList(),
          (json['outputs'] as List)
              ?.map((e) => e == null
                  ? null
                  : CellOutput.fromJson(e as Map<String, dynamic>))
              ?.toList(),
          json['version'] as int);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'deps': deps,
        'inputs': inputs,
        'outputs': outputs,
        'version': version
      };
}
