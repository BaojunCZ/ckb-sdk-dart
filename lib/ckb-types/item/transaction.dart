/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:33:42
 * @Description: file content
 */
import "package:ckb_sdk/ckb-types/item/out_point.dart";
import 'package:ckb_sdk/ckb-types/item/cell_input.dart';
import 'package:ckb_sdk/ckb-types/item/cell_output.dart';

class Transaction {
  String hash;
  List<OutPoint> deps;
  List<CellInput> inputs;
  List<CellOutput> outputs;
  int version;

  Transaction(this.deps, this.hash, this.inputs, this.outputs, this.version);

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
      (json['deps'] as List)
          ?.map((e) =>
              e == null ? null : OutPoint.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['hash'] as String,
      (json['inputs'] as List)
          ?.map((e) =>
              e == null ? null : CellInput.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['outputs'] as List)
          ?.map((e) =>
              e == null ? null : CellOutput.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['version'] as int);
  Map<String, dynamic> toJson() => <String, dynamic>{
        'hash': hash,
        'deps': deps,
        'inputs': inputs,
        'outputs': outputs,
        'version': version
      };
}
