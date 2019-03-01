/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 12:33:13
 * @Description: file content
 */
import 'package:ckb_dart_sdk/ckb-types/item/header.dart';
import 'package:ckb_dart_sdk/ckb-types/item/uncle_block.dart';
import 'package:ckb_dart_sdk/ckb-types/item/transaction.dart';

part 'block.g.dart';

class Block {
  Header header;
  List<UncleBlock> uncles;
  List<int> proposalTransactions;
  List<Transaction> commitTransactions;

  Block(this.header, this.uncles, this.proposalTransactions,
      this.commitTransactions);
  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);
  Map<String, dynamic> toJson() => _$BlockToJson(this);
}
