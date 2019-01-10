/*
 * @Author: BaojunCZ
 * @Date: 2019-01-09 15:01:26
 * @LastEditors: your name
 * @LastEditTime: 2019-01-10 20:58:08
 * @Description: RPC
 */
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../constant/service_url.dart';
import '../response/blockhash_res.dart';
import '../response/transaction_res.dart';
import '../response/header_res.dart';
import '../response/cells_by_type_hash_res.dart';

void main() async {
  final MyRequest = new Request();
  CellsByTypeHash cells = await MyRequest.getCellsByTypeHash(
      '0x0da2fe99fe549e082d4ed483c2e968a89ea8d11aabf5d79e5cbf06522de6e674',
      1,
      3);
  var cell = cells.result[0];
  print(cell.outPoint.hash);
}

class Request {
  static final id = 2;
  static final jsonrpc = "2.0";
  var _body = {"jsonrpc": jsonrpc, "id": id};

  requestRpc() async {
    var dio = new Dio(new Options(
        baseUrl: "http://192.168.2.203:8114/",
        connectTimeout: 5000,
        receiveTimeout: 100000,
        contentType: ContentType.json,
        responseType: ResponseType.PLAIN));
    try {
      Response<String> response = await dio.post("", data: _body);
      print(response.data);
      return jsonDecode(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.message);
      }
    }
  }

  getBlockHash(int blockNumber) async {
    _body["method"] = ServiceUrl.blockHash;
    _body["params"] = [blockNumber];
    return new BlockHashRes.fromJson(await requestRpc());
  }

  getTransaction(String hash) async {
    _body["method"] = ServiceUrl.transaction;
    _body["params"] = [hash];
    return new TransationRes.fromJson(await requestRpc());
  }

  getTipHeader() async {
    _body["method"] = ServiceUrl.tipHeader;
    _body["params"] = [];
    return new HeaderRes.fromJson(await requestRpc());
  }

  getCellsByTypeHash(
      String hash, int fromBlockNumber, int toBlockNumber) async {
    _body["method"] = ServiceUrl.cellsByTypeHash;
    _body["params"] = [hash, fromBlockNumber, toBlockNumber];
    return new CellsByTypeHash.fromJson(await requestRpc());
  }

  getBlock(String blockHash) async {
    _body["method"] = ServiceUrl.block;
    _body["params"] = [blockHash];
    var map = await requestRpc();
    print(map);
  }
}
