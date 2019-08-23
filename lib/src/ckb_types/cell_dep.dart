part of 'package:ckb_sdk/ckb_types.dart';

class CellDep {
  OutPoint outPoint;
  bool isDepGroup;

  CellDep(this.outPoint, this.isDepGroup);

  factory CellDep.fromJson(Map<String, dynamic> json) => CellDep(
      json['out_point'] == null
          ? null
          : OutPoint.fromJson(json['out_point'] as Map<String, dynamic>),
      json['is_dep_group'] as bool);

    Map<String, dynamic> toJson() =>
      <String, dynamic>{'out_point': outPoint, 'is_dep_group': isDepGroup};
}
