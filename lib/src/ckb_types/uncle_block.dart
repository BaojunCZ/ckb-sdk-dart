/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 15:13:07
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:34:11
 * @Description: file content
 */
part of 'package:ckb_sdk/ckb_types.dart';

class UncleBlock {
  Header header;
  List<String> proposals;

  UncleBlock(this.header, this.proposals);
  factory UncleBlock.fromJson(Map<String, dynamic> json) => UncleBlock(
      json['header'] == null ? null : Header.fromJson(json['header'] as Map<String, dynamic>),
      (json['proposals'] as List)?.map((e) => e as String)?.toList());

  Map<String, dynamic> toJson() => <String, dynamic>{'header': header, 'proposals': proposals};
}
