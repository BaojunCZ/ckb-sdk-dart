/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:25:40
 * @Description: file content
 */
import 'package:ckb_sdk/ckb-types/item/header.dart';
import 'package:ckb_sdk/ckb-types/item/uncle_block.dart';
import 'package:ckb_sdk/ckb-types/item/transaction.dart';

class Block {
  Header header;
  List<UncleBlock> uncles;
  List<int> proposalTransactions;
  List<Transaction> commitTransactions;

  Block(this.header, this.uncles, this.proposalTransactions,
      this.commitTransactions);
  factory Block.fromJson(Map<String, dynamic> json) => Block(
      json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      (json['uncles'] as List)
          ?.map((e) =>
              e == null ? null : UncleBlock.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['proposal_transactions'] as List)?.map((e) => e as int)?.toList(),
      (json['commit_transactions'] as List)
          ?.map((e) => e == null
              ? null
              : Transaction.fromJson(e as Map<String, dynamic>))
          ?.toList());
  Map<String, dynamic> toJson() => <String, dynamic>{
        'header': header,
        'uncles': uncles,
        'proposal_transactions': proposalTransactions,
        'commit_transactions': commitTransactions
      };
}
