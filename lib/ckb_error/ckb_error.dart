/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 13:33:47
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 12:29:44
 * @Description: api error
 */
import 'package:ckb_sdk/ckb-types/item/error.dart';

class RPCBaseException implements Exception {
  final String url;

  RPCBaseException(this.url);
}

class NullResultException extends RPCBaseException {
  NullResultException(String url) : super(url);

  String toString() => '"$url": Null result';
}

class RPCTimeOutException extends RPCBaseException {
  RPCTimeOutException(String url) : super(url);

  String toString() => '"$url": RPC TimeOut';
}

class EmptyResponseException extends RPCBaseException {
  EmptyResponseException(String url) : super(url);

  String toString() => '"$url": Empty response';
}

class RPCRequestException extends RPCBaseException {
  final String message;
  final String url;

  RPCRequestException(this.message, this.url) : super(url);

  String toString() => '"$url": ' + message;
}

class RPCErrorException extends RPCBaseException {
  final RPCError error;
  final String url;
  RPCErrorException(this.error, this.url) : super(url);

  String toString() => '"$url": RPC Error Code ${error.code}, Message: ${error.message}';
}

class CommonException {
  final String message;

  CommonException(this.message);

  String toString() => message;
}
