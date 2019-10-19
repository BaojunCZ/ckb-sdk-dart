part of 'package:ckb_sdk/ckb_types.dart';

class Epoch {
  String startNumber;
  String length;
  String compactTarget;

  Epoch(this.startNumber, this.length, this.compactTarget);

  factory Epoch.fromJson(Map<String, dynamic> json) => Epoch(
        json['start_number'] as String,
        json['length'] as String,
        json['compact_target'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'start_number': startNumber,
        'length': length,
        'compact_target': compactTarget,
      };
}
