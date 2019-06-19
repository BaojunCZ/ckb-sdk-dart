part of 'package:ckb_sdk/ckb_rpc.dart';

class CKBApiClient {
  ApiRequest _request;

  CKBApiClient(String nodeUrl) {
    _request = ApiRequest(nodeUrl);
  }

  Future<String> genesisBlockHash() async {
    return await getBlockHash("0");
  }

  Future<Block> genesisBlock() async {
    return await getBlockByBlockNumber("0");
  }

  //==============================Chain RPC Methods================================

  Future<Block> getBlock(String blockHash) async {
    return BlockRes.fromJson(await _request.requestRpc(ServiceUrl.block, [blockHash])).result;
  }

  Future<String> getBlockHash(String blockNumber) async {
    return BlockHashRes.fromJson(await _request.requestRpc(ServiceUrl.blockHash, [blockNumber]))
        .result;
  }

  Future<Block> getBlockByBlockNumber(String blockNumber) async {
    return BlockRes.fromJson(
            await _request.requestRpc(ServiceUrl.getBlockByBlockNumber, [blockNumber]))
        .result;
  }

  Future<List<CellWithOutPoint>> getCellsByLockHash(
      String hash, String fromBlockNumber, String toBlockNumber) async {
    return CellsByLockHashRes.fromJson(await _request
            .requestRpc(ServiceUrl.cellsByLockHash, [hash, fromBlockNumber, toBlockNumber]))
        .result;
  }

  Future<Epoch> getCurrentEpoch() async {
    return EpochRes.fromJson(await _request.requestRpc(ServiceUrl.getCurrentEpoch, [])).result;
  }

  Future<Epoch> getEpochByNumber(String epochNumber) async {
    return EpochRes.fromJson(await _request.requestRpc(ServiceUrl.getCurrentEpoch, [epochNumber]))
        .result;
  }

  Future<CellWithStatus> getLiveCell(OutPoint outPoint) async {
    return LiveCellRes.fromJson(await _request.requestRpc(ServiceUrl.liveCell, [outPoint])).result;
  }

  Future<String> getTipBlockNumber() async {
    return TipBlockNumberRes.fromJson(await _request.requestRpc(ServiceUrl.tipBlockNumber, []))
        .result;
  }

  Future<Header> getTipHeader() async {
    return HeaderRes.fromJson(await _request.requestRpc(ServiceUrl.tipHeader, [])).result;
  }

  Future<TransactionWithStatus> getTransaction(String hash) async {
    return TransactionRes.fromJson(await _request.requestRpc(ServiceUrl.transaction, [hash]))
        .result;
  }

  //==========================Experiment RPC Methods==================================

  Future<String> computeTransactionHash(Transaction transaction) async {
    return ComputeTransactionHashRes.fromJson(
            await _request.requestRpc(ServiceUrl.computeTransactionHash, [transaction]))
        .result;
  }

  Future<Cycles> dryRunTransaction(Transaction transaction) async {
    return DryRunTransactionRes.fromJson(
            await _request.requestRpc(ServiceUrl.dryRunTransaction, [transaction]))
        .result;
  }

  //==========================Indexer RPC Methods========================================

  //==========================Net RPC Methods============================================

  Future<List<NodeInfo>> getPeers() async {
    return PeersRes.fromJson(await _request.requestRpc(ServiceUrl.getPeers, [])).result;
  }

  Future<NodeInfo> getLocalNodeInfo() async {
    return LocalNodeInfoRes.fromJson(await _request.requestRpc(ServiceUrl.localNodeInfo, []))
        .result;
  }

//================================Pool RPC Methods===============================

  Future<String> sendTransaction(Transaction transaction) async {
    return SendTransactionRes.fromJson(
            await _request.requestRpc(ServiceUrl.sendTransaction, [transaction]))
        .result;
  }

  Future<TxPoolInfo> txPoolInfo() async {
    return TxPoolInfoRes.fromJson(await _request.requestRpc(ServiceUrl.txPoolInfo, [])).result;
  }

  //=============================States RPC Methods=====================================

  Future<BlockchainInfo> getBlockchainInfo() async {
    return BlockchainIfnoRes.fromJson(await _request.requestRpc(ServiceUrl.getBlockchainInfo, []))
        .result;
  }

  Future<List<PeerState>> getPeersState() async {
    return PeerStateRes.fromJson(await _request.requestRpc(ServiceUrl.getPeersState, [])).result;
  }
}
