/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:26:44
 * @Description: file content
 */

import 'package:ckb_sdk/ckb-types/item/out_point.dart';

class CellInput {
  OutPoint previousOutput;
  List<String> args;
  String since;

  CellInput(this.previousOutput, this.args, this.since);

  factory CellInput.fromJson(Map<String, dynamic> json) => CellInput(
      json['previous_output'] == null ? null : OutPoint.fromJson(json['previous_output'] as Map<String, dynamic>),
      (json['args'] as List)?.map((e) => e as String)?.toList(),
      json['since'] as String);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'previous_output': previousOutput.toJson(), 'args': args, 'since': since};
}
