part of 'package:ckb_sdk/ckb_types.dart';

class BannedAddress {
  String address;
  String command;
  String banTime;
  String absolute;
  String reason;

  BannedAddress(this.address, this.command, this.banTime, this.absolute, this.reason);

  factory BannedAddress.fromJson(Map<String, dynamic> json) => BannedAddress(
        json['address'] as String,
        json['command'] as String,
        json['ban_time'] as String,
        json['absolute'] as String,
        json['reason'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'address': address,
        'command': command,
        'ban_time': banTime,
        'absolute': absolute,
        'reason': reason,
      };
}
