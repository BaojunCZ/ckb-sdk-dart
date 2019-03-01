/*
 * @Author: BaojunCZ
 * @Date: 2019-01-09 15:01:26
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 15:18:35
 * @Description: api request
 */
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:ckb_dart_sdk/ckb_error/ckb_error.dart';

class ApiRequest {
  int id = 0;
  final jsonrpc = "2.0";
  String _nodeUrl;

  ApiRequest(String nodeUrl) {
    _nodeUrl = nodeUrl;
  }

  requestRpc(String url, params) async {
    try {
      var body = {"jsonrpc": jsonrpc, "id": id};
      body["method"] = url;
      body["params"] = params;
      var response = await http.post(_nodeUrl,
          headers: {'Content-type': 'application/json'},
          body: jsonEncode(body));
      id = id + 1;
      if (response.statusCode == 200) {
        return handlerResult(body, response.body);
      } else {
        throw CkbError.genericError(
            "Request failed with status: ${response.statusCode}.");
      }
    } catch (error) {
      rethrow;
    }
  }

  handlerResult(body, data) {
    if (null == data) {
      throw CkbError.emptyResponse;
    }
    var json = jsonDecode(data);
    if (null == json) {
      throw CkbError.emptyResponse;
    }
    if (null != json["error"]) {
      var error = json["error"];
      throw CkbError.getError(error["code"], error["message"]);
    }
    return json;
  }
}
