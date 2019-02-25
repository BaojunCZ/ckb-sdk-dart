class NodeInfo {
  List<Address> addresses;
  String node_id;
  String version;

  NodeInfo(this.addresses, this.node_id, this.version);

  factory NodeInfo.fromJson(Map<String, dynamic> json) => NodeInfo(
      (json['addresses'] as List)?.map((e) => e == null ? null : Address.fromJson(e as Map<String, dynamic>))?.toList(),
      json['node_id'] as String,
      json['version'] as String);

  Map<String, dynamic> toJson() => {'addresses': this.addresses, 'node_id': this.node_id, 'version': this.version};
}

class Address {
  String address;
  int score;

  Address(this.address, this.score);

  factory Address.fromJson(Map<String, dynamic> json) => Address(json['address'] as String, json['score'] as int);

  Map<String, dynamic> toJson() => {'address': this.address, 'score': this.score};
}
