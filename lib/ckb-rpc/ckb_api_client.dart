/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 13:10:13
 * @LastEditors: your name
 * @LastEditTime: 2019-03-12 13:24:40
 * @Description: json rpc api client
 */
import 'package:ckb_sdk/ckb-rpc/api_request.dart';
import 'package:ckb_sdk/ckb-rpc/service_url.dart';
import 'package:ckb_sdk/ckb-types/res_export.dart';
import 'package:ckb_sdk/ckb_error/ckb_error.dart';

class CKBApiClient {
  ApiRequest _request;

  CKBApiClient(String nodeUrl) {
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
    return BlockHashRes.fromJson(await _request.requestRpc(ServiceUrl.blockHash, [blockNumber]))
        .result;
  }

  Future<TransactionWithStatus> getTransaction(String hash) async {
    try {
      return TransactionRes.fromJson(await _request.requestRpc(ServiceUrl.transaction, [hash]))
          .result;
    } on NullResultException {
      return null;
    } catch (error) {
      rethrow;
    }
  }

  Future<Header> getTipHeader() async {
    return HeaderRes.fromJson(await _request.requestRpc(ServiceUrl.tipHeader, [])).result;
  }

  Future<List<CellWithOutPoint>> getCellsByLockHash(
      String hash, String fromBlockNumber, String toBlockNumber) async {
    return CellsByLockHashRes.fromJson(await _request
            .requestRpc(ServiceUrl.cellsByLockHash, [hash, fromBlockNumber, toBlockNumber]))
        .result;
  }

  Future<CellWithStatus> getLiveCell(OutPoint outPoint) async {
    return LiveCellRes.fromJson(await _request.requestRpc(ServiceUrl.liveCell, [outPoint])).result;
  }

  Future<String> getTipBlockNumber() async {
    return TipBlockNumberRes.fromJson(await _request.requestRpc(ServiceUrl.tipBlockNumber, []))
        .result;
  }

  Future<NodeInfo> getLocalNodeInfo() async {
    return LocalNodeInfoRes.fromJson(await _request.requestRpc(ServiceUrl.localNodeInfo, []))
        .result;
  }

  Future<Block> getBlock(String blockHash) async {
    return BlockRes.fromJson(await _request.requestRpc(ServiceUrl.block, [blockHash])).result;
  }

  Future<Block> getBlockByBlockNumber(String blockNumber) async {
    return BlockRes.fromJson(
            await _request.requestRpc(ServiceUrl.getBlockByBlockNumber, [blockNumber]))
        .result;
  }

  Future<Epoch> getCurrentEpoch() async {
    return EpochRes.fromJson(await _request.requestRpc(ServiceUrl.getCurrentEpoch, [])).result;
  }

  Future<Epoch> getEpochByNumber(String epochNumber) async {
    return EpochRes.fromJson(await _request.requestRpc(ServiceUrl.getCurrentEpoch, [epochNumber]))
        .result;
  }

  Future<TxPoolInfo> txPoolInfo() async {
    return TxPoolInfoRes.fromJson(await _request.requestRpc(ServiceUrl.txPoolInfo, [])).result;
  }

  Future<List<NodeInfo>> getPeers() async {
    return PeersRes.fromJson(await _request.requestRpc(ServiceUrl.getPeers, [])).result;
  }

  Future<BlockchainInfo> getBlockchainInfo() async {
    return BlockchainIfnoRes.fromJson(await _request.requestRpc(ServiceUrl.getBlockchainInfo, []))
        .result;
  }

  Future<List<PeerState>> getPeersState() async {
    return PeerStateRes.fromJson(await _request.requestRpc(ServiceUrl.getPeersState, [])).result;
  }

  Future<Cycles> dryRunTransaction(SendTransaction transaction) async {
    return DryRunTransactionRes.fromJson(
            await _request.requestRpc(ServiceUrl.dryRunTransaction, transaction))
        .result;
  }

  //================================Pool RPC Methods===============================

  Future<String> sendTransaction(SendTransaction transaction) async {
    return SendTransactionRes.fromJson(
            await _request.requestRpc(ServiceUrl.sendTransaction, [transaction]))
        .result;
  }

  //================================Pool RPC Methods===============================

  Future<String> sendTransaction(SendTransaction transaction) async {
    return SendTransactionRes.fromJson(
            await _request.requestRpc(ServiceUrl.sendTransaction, [transaction]))
        .result;
  }
}
