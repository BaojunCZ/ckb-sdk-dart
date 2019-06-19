part of 'package:ckb_sdk/ckb_types.dart';

class CellWithStatus {
  static String LIVE = 'live';
  static String DEAD = 'dead';

  CellOutput cell;
  String status;

  CellWithStatus(this.cell, this.status);

  factory CellWithStatus.fromJson(Map<String, dynamic> json) => CellWithStatus(
      json['cell'] == null ? null : CellOutput.fromJson(json['cell'] as Map<String, dynamic>),
      json['status'] as String);

  Map<String, dynamic> toJson() => <String, dynamic>{'cell': cell, 'status': status};
}
