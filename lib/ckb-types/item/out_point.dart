/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:32:18
 * @Description: file content
 */
class OutPoint {
  String txHash;
  int index;

  OutPoint(this.txHash, this.index);

  factory OutPoint.fromJson(Map<String, dynamic> json) => OutPoint(json['tx_hash'] as String, json['index'] as int);
  Map<String, dynamic> toJson() => <String, dynamic>{'tx_hash': txHash, 'index': index};
}
