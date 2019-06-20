part of 'package:ckb_sdk/ckb_types.dart';

class Witness {
  List<String> data;

  Witness(this.data);

  factory Witness.fromJson(Map<String, dynamic> json) => Witness(
        (json['data'] as List)?.map((e) => e as String)?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': this.data,
      };
}
