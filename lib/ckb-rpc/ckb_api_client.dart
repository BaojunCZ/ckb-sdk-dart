/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 13:10:13
 * @LastEditors: your name
 * @LastEditTime: 2019-03-12 13:24:40
 * @Description: json rpc api client
 */
import 'package:ckb_sdk/ckb-rpc/api_request.dart';
import 'package:ckb_sdk/ckb-rpc/service_url.dart';
import 'package:ckb_sdk/ckb-types/item/transaction_with_status.dart';
import 'package:ckb_sdk/ckb-types/res_export.dart';
import 'package:ckb_sdk/ckb_error/ckb_error.dart';

class CKBApiClient {
  ApiRequest _request;

  CKBApiClient({String nodeUrl = 'http://192.168.2.78:8114'}) {
    _request = ApiRequest(nodeUrl);
  }

  Future<String> genesisBlockHash() async {
    return await getBlockHash("0");
  }

  Future<Block> genesisBlock() async {
    String blockHash = await genesisBlockHash();
    if (blockHash != null) {
      return await getBlock(blockHash);
    } else {
      return null;
    }
  }

  //==============================Chain RPC Methods================================

  Future<String> getBlockHash(String blockNumber) async {
    return BlockHashRes.fromJson(await _request.requestRpc(ServiceUrl.blockHash, [blockNumber])).result;
  }

  Future<TransactionWithStatus> getTransaction(String hash) async {
    try {
      return TransactionRes.fromJson(await _request.requestRpc(ServiceUrl.transaction, [hash])).result;
    } on RPCError catch (error) {
      if (error.code == nullResultCode) {
        return null;
      } else {
        rethrow;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<Header> getTipHeader() async {
    return HeaderRes.fromJson(await _request.requestRpc(ServiceUrl.tipHeader, [])).result;
  }

  Future<List<CellWithOutPoint>> getCellsByLockHash(String hash, String fromBlockNumber, String toBlockNumber) async {
    return CellsByLockHashRes.fromJson(
            await _request.requestRpc(ServiceUrl.cellsByLockHash, [hash, fromBlockNumber, toBlockNumber]))
        .result;
  }

  Future<CellWithStatus> getLiveCell(OutPoint outPoint) async {
    return LiveCellRes.fromJson(await _request.requestRpc(ServiceUrl.liveCell, [outPoint])).result;
  }

  Future<String> getTipBlockNumber() async {
    return TipBlockNumberRes.fromJson(await _request.requestRpc(ServiceUrl.tipBlockNumber, [])).result;
  }

  Future<NodeInfo> getLocalNodeInfo() async {
    return LocalNodeInfoRes.fromJson(await _request.requestRpc(ServiceUrl.localNodeInfo, [])).result;
  }

  Future<Block> getBlock(String blockHash) async {
    return BlockRes.fromJson(await _request.requestRpc(ServiceUrl.block, [blockHash])).result;
  }

  //================================Pool RPC Methods===============================

  Future<String> sendTransaction(transaction) async {
    return SendTransactionRes.fromJson(await _request.requestRpc(ServiceUrl.sendTransaction, [transaction])).result;
  }

  Future<String> traceTransaction(transaction) async {
    return SendTransactionRes.fromJson(await _request.requestRpc(ServiceUrl.traceTransaction, [transaction])).result;
  }

  Future<List<TraceTransaction>> getTraceTransaction(String transationHash) async {
    return TraceTransactionRes.fromJson(await _request.requestRpc(ServiceUrl.getTransactionTrace, [transationHash]))
        .result;
  }
}
