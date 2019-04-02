/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:26:44
 * @Description: file content
 */

class CellInput {
  PreviousOutput previousOutput;
  List<String> args;

  CellInput(this.previousOutput, this.args);

  factory CellInput.fromJson(Map<String, dynamic> json) => CellInput(
      json['previous_output'] == null
          ? null
          : PreviousOutput.fromJson(json['previous_output'] as Map<String, dynamic>),
      (json['args'] as List)?.map((e) => e as String)?.toList());

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'previous_output': previousOutput, 'args': args};
}

class PreviousOutput {
  String hash;
  int index;

  PreviousOutput(this.hash, this.index);

  factory PreviousOutput.fromJson(Map<String, dynamic> json) =>
      PreviousOutput(json['hash'] as String, json['index'] as int);

  Map<String, dynamic> toJson() => <String, dynamic>{'hash': hash, 'index': index};
}
