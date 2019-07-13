part of 'package:ckb_sdk/ckb_types.dart';

class Epoch {
  String epochReward;
  String startNumber;
  String length;
  String difficulty;

  Epoch(this.epochReward, this.startNumber, this.length, this.difficulty);

  factory Epoch.fromJson(Map<String, dynamic> json) => Epoch(
        json['epoch_reward'] as String,
        json['start_number'] as String,
        json['length'] as String,
        json['difficulty'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'epoch_reward': epochReward,
        'start_number': startNumber,
        'length': length,
        'difficulty': difficulty,
      };
}
