/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 13:33:47
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 18:32:26
 * @Description: api error
 */
import '../types/item/error.dart';

class ApiError {
  static var genericErrorCode = -1;
  static var invalidParameters =
      RPCError(genericErrorCode, "Invalid parameters");
  static var emptyResponse =
      RPCError(genericErrorCode, "Empty response");
  static var nullResult = RPCError(genericErrorCode, "Null result");
  static var requstError = "Response Status Code : ";

  static genericError(String message) {
    return RPCError(genericErrorCode, message);
  }

  static getError(code, message) {
    return RPCError(code, message);
  }
}
