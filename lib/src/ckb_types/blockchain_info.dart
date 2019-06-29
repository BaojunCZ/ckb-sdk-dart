part of 'package:ckb_sdk/ckb_types.dart';

class BlockchainInfo {
  bool isInitialBlockDownload;
  String epoch;
  String difficulty;
  String medianTime;
  String chain;
  List<AlertMessage> alerts;

  BlockchainInfo(this.isInitialBlockDownload, this.epoch, this.difficulty, this.medianTime,
      this.chain, this.alerts);

  factory BlockchainInfo.fromJson(Map<String, dynamic> json) => BlockchainInfo(
        json['is_initial_block_download'] as bool,
        json['epoch'] as String,
        json['difficulty'] as String,
        json['median_time'] as String,
        json['chain'] as String,
        (json['alerts'] as List)
            ?.map((e) => e == null ? null : AlertMessage.fromJson(e as Map<String, dynamic>))
            ?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'is_initial_block_download': isInitialBlockDownload,
        'epoch': epoch,
        'difficulty': difficulty,
        'median_time': medianTime,
        'chain': chain,
        'alerts': alerts,
      };
}

class AlertMessage {
  String id;
  String priority;
  String noticeUntil;
  String message;

  AlertMessage(this.id, this.priority, this.noticeUntil, this.message);

  factory AlertMessage.fromJson(Map<String, dynamic> json) => AlertMessage(
        json['id'] as String,
        json['priority'] as String,
        json['notice_until'] as String,
        json['message'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'priority': priority,
        'notice_until': noticeUntil,
        'message': message
      };
}
