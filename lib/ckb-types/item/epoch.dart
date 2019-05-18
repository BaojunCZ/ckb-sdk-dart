class Epoch {
  String blockReward;
  String lastBlockHashInPreviousEpoch;
  String startNumber;
  String length;
  String difficulty;
  String remainderReward;

  Epoch(this.blockReward, this.lastBlockHashInPreviousEpoch, this.startNumber, this.length, this.difficulty,
      this.remainderReward);

  factory Epoch.fromJson(Map<String, dynamic> json) => Epoch(
        json['block_reward'] as String,
        json['last_block_hash_in_previous_epoch'] as String,
        json['start_number'] as String,
        json['length'] as String,
        json['difficulty'] as String,
        json['remainder_reward'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'block_reward': blockReward,
        'last_block_hash_in_previous_epoch': lastBlockHashInPreviousEpoch,
        'start_number': startNumber,
        'length': length,
        'difficulty': difficulty,
        'remainder_reward': remainderReward,
      };
}
