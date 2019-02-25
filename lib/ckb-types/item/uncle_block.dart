/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 15:13:07
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 15:39:48
 * @Description: file content
 */
import './header.dart';
import './transaction.dart';
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
