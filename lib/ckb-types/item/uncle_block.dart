/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 15:13:07
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 12:34:33
 * @Description: file content
 */
import 'package:ckb_dart_sdk/ckb-types/item/header.dart';
import 'package:ckb_dart_sdk/ckb-types/item/transaction.dart';
part 'uncle_block.g.dart';

class UncleBlock {
  Header header;
  Transaction cellbase;
  List<int> proposalTransactions;

  UncleBlock(this.header, this.cellbase, this.proposalTransactions);
  factory UncleBlock.fromJson(Map<String, dynamic> json) =>
      _$UncleBlockFromJson(json);
  Map<String, dynamic> toJson() => _$UncleBlockToJson(this);
}
