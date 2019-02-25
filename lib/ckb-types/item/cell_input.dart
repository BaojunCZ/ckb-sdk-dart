/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-02-02 17:41:17
 * @Description: file content
 */
import 'unlock.dart';

part 'cell_input.g.dart';

class CellInput {
  PreviousOutput previousOutput;
  Unlock unlock;

  CellInput(this.previousOutput, this.unlock);

  factory CellInput.fromJson(Map<String, dynamic> json) => _$CellInputFromJson(json);

  Map<String, dynamic> toJson() => _$CellInputToJson(this);
}

class PreviousOutput {
  String hash;
  int index;

  PreviousOutput(this.hash, this.index);

  factory PreviousOutput.fromJson(Map<String, dynamic> json) => _$PreviousOutputFromJson(json);

  Map<String, dynamic> toJson() => _$PreviousOutputToJson(this);
}
