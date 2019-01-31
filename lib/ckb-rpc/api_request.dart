/*
 * @Author: BaojunCZ
 * @Date: 2019-01-09 15:01:26
 * @LastEditors: your name
 * @LastEditTime: 2019-01-31 17:58:37
 * @Description: api request
 */
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import './api_error.dart';

class ApiRequest {
  static final id = 2;
  static final jsonrpc = "2.0";
  static Dio dio;

  ApiRequest(String nodeUrl) {
    dio = new Dio(new Options(
        baseUrl: nodeUrl,
        connectTimeout: 5000,
        receiveTimeout: 100000,
        contentType: ContentType.json,
        responseType: ResponseType.PLAIN));
  }

  requestRpc(String url, params) async {
    var body = {"jsonrpc": jsonrpc, "id": id};
    body["method"] = url;
    body["params"] = params;
    try {
      var response = await dio.post("", data: body);
      return handlerResult(body, response.data);
    } on DioError catch (e) {
      if (null != e.response) {
        throw ApiError.genericError(e.response.statusCode.toString());
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        throw ApiError.genericError(e.message);
      }
    }
  }

  handlerResult(body, data) {
    if (null == data) {
      throw ApiError.emptyResponse;
    }
    var json = jsonDecode(data);
    if (null == json) {
      throw ApiError.emptyResponse;
    }
    if (null != json["error"]) {
      var error = json["error"];
      throw ApiError.getError(error["code"], error["message"]);
    }
    if (null == json["result"]) {
      throw ApiError.nullResult;
    }
    // print(body["method"] + ">>>>");
    // print(json);
    return json;
  }
}
