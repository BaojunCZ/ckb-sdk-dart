/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 13:10:13
 * @LastEditors: your name
 * @LastEditTime: 2019-02-04 12:54:00
 * @Description: json rpc api client
 */
import './api_request.dart';
import './service_url.dart';
import '../ckb-types/res_export.dart';
import '../ckb_error/ckb_error.dart';
import '../ckb-utils/sha3.dart';
import 'package:convert/convert.dart';

export './api_request.dart';
export '../ckb-types/res_export.dart';

class ApiClient {
  ApiRequest _request;

  ApiClient(String nodeUrl) {
    _request = ApiRequest(nodeUrl);
  }

  setNodeUrl(String url) {
    _request.setNodeUrl(url);
  }

  Future<String> genesisBlockHash() async {
    return BlockHashRes.fromJson(await _request.requestRpc(ServiceUrl.blockHash, [0])).result;
  }

  Future<Block> genesisBlock() async {
    String blockHash = await genesisBlockHash();
    if (blockHash != null) {
      return BlockRes.fromJson(await _request.requestRpc(ServiceUrl.block, [blockHash])).result;
    } else {
      return null;
    }
  }

  //==============================Chain RPC Methods================================

  Future<String> getBlockHash(int blockNumber) async {
    return BlockHashRes.fromJson(await _request.requestRpc(ServiceUrl.blockHash, [blockNumber])).result;
  }

  Future<Transaction> getTransaction(String hash) async {
    return TransactionRes.fromJson(await _request.requestRpc(ServiceUrl.transaction, [hash])).result;
  }

  Future<Header> getTipHeader() async {
    return HeaderRes.fromJson(await _request.requestRpc(ServiceUrl.tipHeader, [])).result;
  }

  Future<List<Cell>> getCellsByTypeHash(String hash, int fromBlockNumber, int toBlockNumber) async {
    return CellsByTypeHashRes.fromJson(
            await _request.requestRpc(ServiceUrl.cellsByTypeHash, [hash, fromBlockNumber, toBlockNumber]))
        .result;
  }

  Future<CellWithStatus> getLiveCell(OutPoint outPoint) async {
    return LiveCellRes.fromJson(await _request.requestRpc(ServiceUrl.liveCell, [outPoint])).result;
  }

  Future<int> getTipBlockNumber() async {
    return TipBlockNumberRes.fromJson(await _request.requestRpc(ServiceUrl.tipBlockNumber, [])).result;
  }

  Future<String> getLocalNodeId() async {
    return LocalNodeIdRes.fromJson(await _request.requestRpc(ServiceUrl.localNodeId, [])).result;
  }

  Future<Block> getBlock(String blockHash) async {
    return BlockRes.fromJson(await _request.requestRpc(ServiceUrl.block, [blockHash])).result;
  }

  //================================Pool RPC Methods===============================

  Future<String> sendTransaction(transaction) async {
    return SendTransactionRes.fromJson(await _request.requestRpc(ServiceUrl.sendTransaction, [transaction])).result;
  }

  Future<String> alwaysSuccessCellHash() async {
    Block block = await genesisBlock();
    List<CellOutput> outputs = block.commitTransactions[0].outputs;
    if (outputs.length == 0 || outputs[0] == null) {
      throw CkbError.genericError("Cannot find always success cell");
    }
    final SHA3Digest sha3digest = SHA3Digest(256);
    var data = outputs[0].data.startsWith("0x") ? outputs[0].data.replaceFirst("0x", "") : outputs[0].data;
    var result = sha3digest.process(hex.decode(data));
    return hex.encode(result);
  }

  Future<OutPoint> alwaysSuccessScriptOutPoint() async {
    Block block = await genesisBlock();
    String hash = block.commitTransactions[0].hash;
    return OutPoint(hash, 0);
  }
}
