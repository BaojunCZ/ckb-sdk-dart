part of 'package:ckb_sdk/ckb_types.dart';

class CellDep {
  static const String CODE = "code";
  static const String DEP_GROUP = "dep_group";

  OutPoint outPoint;
  String depType;

  CellDep(this.outPoint, this.depType);

  factory CellDep.fromJson(Map<String, dynamic> json) => CellDep(
      json['out_point'] == null
          ? null
          : OutPoint.fromJson(json['out_point'] as Map<String, dynamic>),
      json['dep_type'] as String);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'out_point': outPoint, 'dep_type': depType};
}
