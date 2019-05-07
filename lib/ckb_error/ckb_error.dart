/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 13:33:47
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 12:29:44
 * @Description: api error
 */
import 'package:ckb_sdk/ckb-types/item/error.dart';

final genericErrorCode = -1;
final nullResultCode = -2;
final invalidParameters = RPCError(genericErrorCode, "Invalid parameters");
final emptyResponse = RPCError(genericErrorCode, "Empty response");
final nullResult = RPCError(nullResultCode, "Null result");

genericError(String message) {
  return RPCError(genericErrorCode, message);
}

getError(code, message) {
  return RPCError(code, message);
}
