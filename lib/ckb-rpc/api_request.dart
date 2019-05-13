/*
 * @Author: BaojunCZ
 * @Date: 2019-01-09 15:01:26
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 15:18:35
 * @Description: api request
 */
import 'dart:convert';

import 'package:ckb_sdk/ckb-types/item/error.dart';
import 'package:ckb_sdk/ckb_error/ckb_error.dart';
import 'package:http/http.dart' as http;

class ApiRequest {
  int id = 0;
  final jsonrpc = "2.0";
  String _nodeUrl;

  ApiRequest(String nodeUrl) {
    _nodeUrl = nodeUrl;
  }

  requestRpc(String url, params) async {
    var body = {"jsonrpc": jsonrpc, "id": id};
    body["method"] = url;
    body["params"] = params;
    var response = await http
        .post(_nodeUrl, headers: {'Content-type': 'application/json'}, body: jsonEncode(body))
        .timeout(Duration(seconds: 10), onTimeout: () {
      throw RPCTimeOutException(url);
    });
    id = id + 1;
    if (response.statusCode == 200) {
      return handlerResult(url, body, response.body);
    } else {
      throw RPCRequestException("Request failed with status: ${response.statusCode}.", url);
    }
  }

  handlerResult(url, body, data) {
    if (null == data) {
      throw EmptyResponseException(url);
    }
    var json = jsonDecode(data);
    if (null == json) {
      throw EmptyResponseException(url);
    }
    if (null == json['result']) {
      throw NullResultException(url);
    }
    if (null != json["error"]) {
      var error = json["error"];
      throw RPCErrorException(RPCError(error["code"], error["message"]), url);
    }
    return json;
  }
}
