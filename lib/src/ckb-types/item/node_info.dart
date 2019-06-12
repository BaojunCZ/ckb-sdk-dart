part of 'package:ckb_sdk/ckb_types.dart';

class NodeInfo {
  List<Address> addresses;
  String nodeId;
  String version;

  NodeInfo(this.addresses, this.nodeId, this.version);

  factory NodeInfo.fromJson(Map<String, dynamic> json) => NodeInfo(
      (json['addresses'] as List)
          ?.map((e) => e == null ? null : Address.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['node_id'] as String,
      json['version'] as String);

  Map<String, dynamic> toJson() =>
      {'addresses': this.addresses, 'node_id': this.nodeId, 'version': this.version};
}

class Address {
  String address;
  String score;

  Address(this.address, this.score);

  factory Address.fromJson(Map<String, dynamic> json) =>
      Address(json['address'] as String, json['score'] as String);

  Map<String, dynamic> toJson() => {'address': this.address, 'score': this.score};
}
