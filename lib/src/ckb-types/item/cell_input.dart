/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:26:44
 * @Description: file content
 */
part of 'package:ckb_sdk/ckb_types.dart';

class CellInput {
  OutPoint previousOutput;
  String since;

  CellInput(this.previousOutput, this.since);

  factory CellInput.fromJson(Map<String, dynamic> json) => CellInput(
      json['previous_output'] == null
          ? null
          : OutPoint.fromJson(json['previous_output'] as Map<String, dynamic>),
      json['since'] as String);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'previous_output': previousOutput.toJson(), 'since': since};
}
