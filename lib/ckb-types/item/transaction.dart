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
import 'package:ckb_sdk/ckb-types/item/witness.dart';

class Transaction {
  int version;
  String hash;
  List<OutPoint> deps;
  List<CellInput> inputs;
  List<CellOutput> outputs;
  List<Witness> witness;

  Transaction(this.version, this.hash, this.deps, this.inputs, this.outputs, this.witness);

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
      json['version'] as int,
      json['hash'] as String,
      (json['deps'] as List)
          ?.map((e) => e == null ? null : OutPoint.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['inputs'] as List)
          ?.map((e) => e == null ? null : CellInput.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['outputs'] as List)
          ?.map((e) => e == null ? null : CellOutput.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['witness'] as List)
          ?.map((e) => e == null ? null : Witness.fromJson(e as Map<String, dynamic>)));

  Map<String, dynamic> toJson() => <String, dynamic>{
        'version': version,
        'hash': hash,
        'deps': deps,
        'inputs': inputs,
        'outputs': outputs,
        'witness': witness
      };
}
