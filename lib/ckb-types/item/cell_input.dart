/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:26:44
 * @Description: file content
 */
import 'package:ckb_sdk/ckb-types/item/unlock.dart';

class CellInput {
  PreviousOutput previousOutput;
  Unlock unlock;

  CellInput(this.previousOutput, this.unlock);

  factory CellInput.fromJson(Map<String, dynamic> json) => CellInput(
      json['previous_output'] == null
          ? null
          : PreviousOutput.fromJson(
              json['previous_output'] as Map<String, dynamic>),
      json['unlock'] == null
          ? null
          : Unlock.fromJson(json['unlock'] as Map<String, dynamic>));

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'previous_output': previousOutput, 'unlock': unlock};
}

class PreviousOutput {
  String hash;
  int index;

  PreviousOutput(this.hash, this.index);

  factory PreviousOutput.fromJson(Map<String, dynamic> json) =>
      PreviousOutput(json['hash'] as String, json['index'] as int);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'hash': hash, 'index': index};
}
