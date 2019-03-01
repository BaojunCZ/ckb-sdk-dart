/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 15:06:00
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 12:35:30
 * @Description: file content
 */
import 'package:ckb_dart_sdk/ckb-types/response.dart';
import 'package:ckb_dart_sdk/ckb-types/item/block.dart';

class BlockRes extends RPCResponse<Block> {
  BlockRes(id, jsonrpc, result, error) : super(id, jsonrpc, result, error);

  factory BlockRes.fromJson(Map<String, dynamic> json) {
    return BlockRes(
        json['id'],
        json['jsonrpc'],
        json['result'] == null ? null : Block.fromJson(json['result']),
        json['error'] == null ? null : RPCError.fromJson(json['error']));
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'jsonrpc': this.jsonrpc,
        'result': this.result,
        'error': this.error
      };
}
