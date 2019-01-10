import 'package:json_annotation/json_annotation.dart';
part 'out_point.g.dart';

@JsonSerializable()
class OutPoint {
  String hash;
  int index;

  OutPoint(this.hash, this.index);

  factory OutPoint.fromJson(Map<String, dynamic> json) =>
      _$OutPointFromJson(json);
  Map<String, dynamic> toJson() => _$OutPointToJson(this);
}
