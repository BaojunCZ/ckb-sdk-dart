part of 'package:ckb_sdk/ckb_types.dart';

class BlockchainInfo {
  bool isInitialBlockDownload;
  String epoch;
  String difficulty;
  String medianTime;
  String chain;
  String warnings;

  BlockchainInfo(this.isInitialBlockDownload, this.epoch, this.difficulty, this.medianTime,
      this.chain, this.warnings);

  factory BlockchainInfo.fromJson(Map<String, dynamic> json) => BlockchainInfo(
        json['is_initial_block_download'] as bool,
        json['epoch'] as String,
        json['difficulty'] as String,
        json['median_time'] as String,
        json['chain'] as String,
        json['warnings'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'is_initial_block_download': isInitialBlockDownload,
        'epoch': epoch,
        'difficulty': difficulty,
        'median_time': medianTime,
        'chain': chain,
        'warnings': warnings,
      };
}
