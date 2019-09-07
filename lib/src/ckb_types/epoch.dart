part of 'package:ckb_sdk/ckb_types.dart';

class Epoch {
  String startNumber;
  String length;
  String difficulty;

  Epoch(this.startNumber, this.length, this.difficulty);

  factory Epoch.fromJson(Map<String, dynamic> json) => Epoch(
        json['start_number'] as String,
        json['length'] as String,
        json['difficulty'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'start_number': startNumber,
        'length': length,
        'difficulty': difficulty,
      };
}
