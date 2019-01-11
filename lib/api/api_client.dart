/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 13:10:13
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 18:33:14
 * @Description: json rpc api client
 */
import './api_request.dart';
import '../constant/service_url.dart';
import '../types/res_export.dart';

export './api_request.dart';
export '../types/res_export.dart';

class ApiClient {
  static ApiRequest request;
  ApiClient(String nodeUrl) {
    request = new ApiRequest(nodeUrl);
  }

  genesisBlockHash() async {
    return new BlockHashRes.fromJson(
        await request.requestRpc(ServiceUrl.blockHash, [0]));
  }

  genesisBlock() async {
    BlockHashRes blockHash = await genesisBlockHash();
    if (blockHash.result != null) {
      return new BlockRes.fromJson(
          await request.requestRpc(ServiceUrl.block, [blockHash.result]));
    } else {
      return blockHash;
    }
  }

  //==============================Chain RPC Methods================================

  getBlockHash(int blockNumber) async {
    return new BlockHashRes.fromJson(
        await request.requestRpc(ServiceUrl.blockHash, [blockNumber]));
  }

  getTransaction(String hash) async {
    return new TransationRes.fromJson(
        await request.requestRpc(ServiceUrl.transaction, [hash]));
  }

  getTipHeader() async {
    return new HeaderRes.fromJson(
        await request.requestRpc(ServiceUrl.tipHeader, []));
  }

  getCellsByTypeHash(
      String hash, int fromBlockNumber, int toBlockNumber) async {
    return new CellsByTypeHash.fromJson(await request.requestRpc(
        ServiceUrl.cellsByTypeHash, [hash, fromBlockNumber, toBlockNumber]));
  }

  getLiveCell(OutPoint outPoint) async {
    return new LiveCellRes.fromJson(
        await request.requestRpc(ServiceUrl.liveCell, [outPoint]));
  }

  getTipBlockNumber() async {
    return new TipBlockNumberRes.fromJson(
        await request.requestRpc(ServiceUrl.tipBlockNumber, []));
  }

  getLocalNodeId() async {
    return new LocalNodeIdRes.fromJson(
        await request.requestRpc(ServiceUrl.localNodeId, []));
  }

  getBlock(String blockHash) async {
    return new BlockRes.fromJson(
        await request.requestRpc(ServiceUrl.block, [blockHash]));
  }

  //================================Pool RPC Methods===============================

  sendTransaction(transaction) async {
    return new SendTransactionRes.fromJson(
        await request.requestRpc(ServiceUrl.sendTransaction, [transaction]));
  }
}
