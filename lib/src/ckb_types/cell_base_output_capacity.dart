part of 'package:ckb_sdk/ckb_types.dart';

class CellbaseOutputCapacity {
  String primary;
  String proposalReward;
  String secondary;
  String total;
  String txFee;

  CellbaseOutputCapacity(this.primary, this.proposalReward, this.secondary, this.total, this.txFee);

  factory CellbaseOutputCapacity.fromJson(Map<String, dynamic> json) => CellbaseOutputCapacity(
        json['primary'] as String,
        json['proposal_reward'] as String,
        json['secondary'] as String,
        json['total'] as String,
        json['tx_fee'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'primary': primary,
        'proposal_reward': proposalReward,
        'secondary': secondary,
        'total': total,
        'tx_fee': txFee,
      };
}
