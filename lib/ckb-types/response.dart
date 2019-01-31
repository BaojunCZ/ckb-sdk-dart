/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 18:06:57
 * @Description: file content
 */
import './item/error.dart';
export './item/error.dart';

class RPCResponse<T> {
  int id;
  String jsonrpc;
  T result;
  RPCError error;

  RPCResponse(this.id, this.jsonrpc, this.result, this.error);

   Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'jsonrpc': this.jsonrpc,
        'result': this.result,
        'error': this.error
      };
}
