/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:25:40
 * @Description: file content
 */

part of 'package:ckb_sdk/ckb_types.dart';

class Block {
  Header header;
  List<UncleBlock> uncles;
  List<String> proposals;
  List<Transaction> transactions;

  Block(this.header, this.uncles, this.proposals, this.transactions);

  factory Block.fromJson(Map<String, dynamic> json) => Block(
      json['header'] == null ? null : Header.fromJson(json['header'] as Map<String, dynamic>),
      (json['uncles'] as List)
          ?.map((e) => e == null ? null : UncleBlock.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['proposals'] as List)?.map((e) => e as String)?.toList(),
      (json['transactions'] as List)
          ?.map((e) => e == null ? null : Transaction.fromJson(e as Map<String, dynamic>))
          ?.toList());

  Map<String, dynamic> toJson() => <String, dynamic>{
        'header': header,
        'uncles': uncles,
        'proposals': proposals,
        'transactions': transactions
      };
}
