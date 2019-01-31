/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 15:39:13
 * @Description: file content
 */
import './header.dart';
import './uncle_block.dart';
import './transaction.dart';

import 'package:json_annotation/json_annotation.dart';
part 'block.g.dart';

@JsonSerializable()
class Block {
  Header header;
  List<UncleBlock> uncles;
  @JsonKey(name: 'proposal_transactions')
  List<int> proposalTransactions;
  @JsonKey(name: 'commit_transactions')
  List<Transaction> commitTransactions;

  Block(this.header, this.uncles, this.proposalTransactions,
      this.commitTransactions);
  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);
  Map<String, dynamic> toJson() => _$BlockToJson(this);
}
