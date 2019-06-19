part of 'package:ckb_sdk/ckb_types.dart';

class CellWithCreate {
  CellOutput cellOutput;
  CreateBy createBy;

  CellWithCreate(this.cellOutput, this.createBy);

  factory CellWithCreate.fromJson(Map<String, dynamic> json) => CellWithCreate(
        json['cell_output'] == null ? null : CellOutput.fromJson(json['cell_output']),
        json['created_by'] == null ? null : CreateBy.fromJson(json['created_by']),
      );
}

class CreateBy {
  String blockNumber;
  String index;
  String txHash;

  CreateBy(this.blockNumber, this.index, this.txHash);

  factory CreateBy.fromJson(Map<String, dynamic> json) => CreateBy(
        json['block_number'] as String,
        json['index'] as String,
        json['tx_hash'] as String,
      );

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'block_number': blockNumber, 'index': index, 'tx_hash': txHash};
}
