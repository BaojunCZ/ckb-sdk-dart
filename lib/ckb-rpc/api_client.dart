/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 13:10:13
 * @LastEditors: your name
 * @LastEditTime: 2019-03-12 13:24:40
 * @Description: json rpc api client
 */
library ckb_client;

import 'package:convert/convert.dart';
import 'package:ckb_sdk/ckb-types/res_export.dart';
import 'package:ckb_sdk/ckb_error/ckb_error.dart';
import 'package:ckb_sdk/ckb-rpc/api_request.dart';
import 'package:ckb_sdk/ckb-rpc/service_url.dart';
import 'package:ckb_sdk/ckb-utils/blake2b.dart';

class ApiClient {
  ApiRequest _request;

  ApiClient({String nodeUrl = 'http://192.168.2.203:8114/'}) {
    _request = ApiRequest(nodeUrl);
  }

  Future<String> genesisBlockHash() async {
    return BlockHashRes.fromJson(
            await _request.requestRpc(ServiceUrl.blockHash, [0]))
        .result;
  }

  Future<Block> genesisBlock() async {
    String blockHash = await genesisBlockHash();
    if (blockHash != null) {
      return BlockRes.fromJson(
              await _request.requestRpc(ServiceUrl.block, [blockHash]))
          .result;
    } else {
      return null;
    }
  }

  //==============================Chain RPC Methods================================

  Future<String> getBlockHash(int blockNumber) async {
    return BlockHashRes.fromJson(
            await _request.requestRpc(ServiceUrl.blockHash, [blockNumber]))
        .result;
  }

  Future<Transaction> getTransaction(String hash) async {
    return TransactionRes.fromJson(
            await _request.requestRpc(ServiceUrl.transaction, [hash]))
        .result;
  }

  Future<Header> getTipHeader() async {
    return HeaderRes.fromJson(
            await _request.requestRpc(ServiceUrl.tipHeader, []))
        .result;
  }

  Future<List<Cell>> getCellsByTypeHash(
      String hash, int fromBlockNumber, int toBlockNumber) async {
    return CellsByTypeHashRes.fromJson(await _request.requestRpc(
            ServiceUrl.cellsByTypeHash, [hash, fromBlockNumber, toBlockNumber]))
        .result;
  }

  Future<CellWithStatus> getLiveCell(OutPoint outPoint) async {
    return LiveCellRes.fromJson(
            await _request.requestRpc(ServiceUrl.liveCell, [outPoint]))
        .result;
  }

  Future<int> getTipBlockNumber() async {
    return TipBlockNumberRes.fromJson(
            await _request.requestRpc(ServiceUrl.tipBlockNumber, []))
        .result;
  }

  Future<NodeInfo> getLocalNodeInfo() async {
    return LocalNodeInfoRes.fromJson(
            await _request.requestRpc(ServiceUrl.localNodeInfo, []))
        .result;
  }

  Future<Block> getBlock(String blockHash) async {
    return BlockRes.fromJson(
            await _request.requestRpc(ServiceUrl.block, [blockHash]))
        .result;
  }

  //================================Pool RPC Methods===============================

  Future<String> sendTransaction(transaction) async {
    return SendTransactionRes.fromJson(await _request
            .requestRpc(ServiceUrl.sendTransaction, [transaction]))
        .result;
  }

  Future<String> traceTransaction(transaction) async {
    return SendTransactionRes.fromJson(await _request
            .requestRpc(ServiceUrl.traceTransaction, [transaction]))
        .result;
  }

  Future<List<TraceTransaction>> getTraceTransaction(
      String transationHash) async {
    return TraceTransactionRes.fromJson(await _request
            .requestRpc(ServiceUrl.getTransactionTrace, [transationHash]))
        .result;
  }

  Future<String> alwaysSuccessCellHash() async {
    Block block = await genesisBlock();
    List<CellOutput> outputs = block.commitTransactions[0].outputs;
    if (outputs.isEmpty || outputs[0] == null) {
      throw CkbError.genericError("Cannot find always success cell");
    }
    final Blake2b blake2b = new Blake2b(digestSize: 32);
    var data = outputs[0].data.startsWith("0x")
        ? outputs[0].data.replaceFirst("0x", "")
        : outputs[0].data;
    var result = blake2b.process(hex.decode(data));
    return hex.encode(result);
  }

  Future<OutPoint> alwaysSuccessScriptOutPoint() async {
    Block block = await genesisBlock();
    String hash = block.commitTransactions[0].hash;
    return OutPoint(hash, 0);
  }
}
