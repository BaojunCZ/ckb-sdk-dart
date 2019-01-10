import 'package:json_annotation/json_annotation.dart';
part 'cell_output.g.dart';

@JsonSerializable()
class CellOutput {
  int capacity;
  String data;
  String lock;
  dynamic type;

  CellOutput(this.capacity, this.data, this.lock, this.type);

  factory CellOutput.fromJson(Map<String, dynamic> json) =>
      _$CellOutputFromJson(json);
  Map<String, dynamic> toJson() => _$CellOutputToJson(this);
}
