/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:32:18
 * @Description: file content
 */
class OutPoint {
  String hash;
  int index;

  OutPoint(this.hash, this.index);

  factory OutPoint.fromJson(Map<String, dynamic> json) =>
      OutPoint(json['hash'] as String, json['index'] as int);
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'hash': hash, 'index': index};
}
