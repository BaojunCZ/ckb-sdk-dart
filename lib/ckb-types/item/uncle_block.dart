/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 15:13:07
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:34:11
 * @Description: file content
 */
import 'package:ckb_dart_sdk/ckb-types/item/header.dart';
import 'package:ckb_dart_sdk/ckb-types/item/transaction.dart';

class UncleBlock {
  Header header;
  Transaction cellbase;
  List<int> proposalTransactions;

  UncleBlock(this.header, this.cellbase, this.proposalTransactions);
  factory UncleBlock.fromJson(Map<String, dynamic> json) => UncleBlock(
      json['header'] == null
          ? null
          : Header.fromJson(json['header'] as Map<String, dynamic>),
      json['cellbase'] == null
          ? null
          : Transaction.fromJson(json['cellbase'] as Map<String, dynamic>),
      (json['proposal_transactions'] as List)?.map((e) => e as int)?.toList());

  Map<String, dynamic> toJson() => <String, dynamic>{
        'header': header,
        'cellbase': cellbase,
        'proposal_transactions': proposalTransactions
      };
}
