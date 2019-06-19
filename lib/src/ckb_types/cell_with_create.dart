part of 'package:ckb_sdk/ckb_types.dart';

class CellWithCreate {
  CellOutput cellOutput;
  TransactionPoint createBy;

  CellWithCreate(this.cellOutput, this.createBy);

  factory CellWithCreate.fromJson(Map<String, dynamic> json) => CellWithCreate(
        json['cell_output'] == null ? null : CellOutput.fromJson(json['cell_output']),
        json['created_by'] == null ? null : TransactionPoint.fromJson(json['created_by']),
      );
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'cell_output': cellOutput, 'create_by': createBy};
}
