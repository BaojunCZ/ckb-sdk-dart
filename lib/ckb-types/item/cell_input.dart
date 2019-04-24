/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:26:44
 * @Description: file content
 */

class CellInput {
  String txHash;
  int index;
  List<String> args;
  String since;

  CellInput(this.txHash, this.index, this.args, this.since);

  factory CellInput.fromJson(Map<String, dynamic> json) => CellInput(json['tx_hash'] as String, json['index'] as int,
      (json['args'] as List)?.map((e) => e as String)?.toList(), json['since'] as String);

  Map<String, dynamic> toJson() => <String, dynamic>{'tx_hash': txHash, 'index': index, 'args': args, 'since': since};
}
