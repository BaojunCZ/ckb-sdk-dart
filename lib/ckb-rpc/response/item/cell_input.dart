import 'package:json_annotation/json_annotation.dart';
part 'cell_input.g.dart';

@JsonSerializable()
class CellInput {
  @JsonKey(name: 'previous_output')
  PreviousOutput previousOutput;
  Unlock unlock;

  CellInput(this.previousOutput, this.unlock);

  factory CellInput.fromJson(Map<String, dynamic> json) => _$CellInputFromJson(json);
  Map<String, dynamic> toJson() => _$CellInputToJson(this);
}

@JsonSerializable()
class PreviousOutput {
  String hash;
  int index;

  PreviousOutput(this.hash, this.index);

  factory PreviousOutput.fromJson(Map<String, dynamic> json) =>
      _$PreviousOutputFromJson(json);
  Map<String, dynamic> toJson() => _$PreviousOutputToJson(this);
}

@JsonSerializable()
class Unlock {
  List<int> args;
  String binary;
  dynamic reference;
  @JsonKey(name: 'signed_args')
  List<int> signedArgs;
  int version;

  Unlock(this.args, this.binary, this.reference, this.signedArgs, this.version);

  factory Unlock.fromJson(Map<String, dynamic> json) => _$UnlockFromJson(json);
  Map<String, dynamic> toJson() => _$UnlockToJson(this);
}
