part of 'package:ckb_sdk/ckb_rpc.dart';

class CKBApiClient {
  ApiRequest _request;

  CKBApiClient(String nodeUrl) {
    _request = ApiRequest(nodeUrl);
  }

  Future<String> genesisBlockHash() async {
    return await getBlockHash("0x0");
  }

  Future<Block> genesisBlock() async {
    return await getBlockByBlockNumber("0x0");
  }

  //==============================Chain RPC Methods================================

  Future<Block> getBlock(String blockHash) async {
    return Block.fromJson(
        await _request.requestRpc(ServiceUrl.block, [blockHash]));
  }

  Future<String> getBlockHash(String blockNumber) async {
    return await _request
        .requestRpc(ServiceUrl.blockHash, [toHex(blockNumber)]);
  }

  Future<Block> getBlockByBlockNumber(String blockNumber) async {
    return Block.fromJson(await _request
        .requestRpc(ServiceUrl.getBlockByBlockNumber, [toHex(blockNumber)]));
  }

  Future<List<CellWithOutPoint>> getCellsByLockHash(
      String hash, String fromBlockNumber, String toBlockNumber) async {
    final result = await _request.requestRpc(ServiceUrl.cellsByLockHash,
        [hash, toHex(fromBlockNumber), toHex(toBlockNumber)]);
    return result == null
        ? null
        : (result as List)
            ?.map((e) => e == null
                ? null
                : CellWithOutPoint.fromJson(e as Map<String, dynamic>))
            ?.toList();
  }

  Future<Epoch> getCurrentEpoch() async {
    final result = await _request.requestRpc(ServiceUrl.getCurrentEpoch, []);
    return result == null ? null : Epoch.fromJson(result);
  }

  Future<Epoch> getEpochByNumber(String epochNumber) async {
    final result = await _request
        .requestRpc(ServiceUrl.getEpochByNumber, [toHex(epochNumber)]);
    return result == null ? null : Epoch.fromJson(result);
  }

  Future<CellWithStatus> getLiveCell(OutPoint outPoint, bool withData) async {
    final result = await _request
        .requestRpc(ServiceUrl.liveCell, [parseOutPoint(outPoint), withData]);
    return result == null ? null : CellWithStatus.fromJson(result);
  }

  Future<String> getTipBlockNumber() async {
    return await _request.requestRpc(ServiceUrl.tipBlockNumber, []);
  }

  Future<Header> getTipHeader() async {
    return Header.fromJson(await _request.requestRpc(ServiceUrl.tipHeader, []));
  }

  Future<TransactionWithStatus> getTransaction(String hash) async {
    final result = await _request.requestRpc(ServiceUrl.transaction, [hash]);
    return result == null ? null : TransactionWithStatus.fromJson(result);
  }

  Future<CellbaseOutputCapacity> getCellbaseOutputCapacityDetails(
      String blockHash) async {
    final result = await _request
        .requestRpc(ServiceUrl.cellbaseOutputCapacity, [blockHash]);
    return result == null ? null : CellbaseOutputCapacity.fromJson(result);
  }

  Future<Header> getHeader(String blockHash) async {
    final result = await _request.requestRpc(ServiceUrl.getHeader, [blockHash]);
    return result == null ? null : Header.fromJson(result);
  }

  Future<Header> getHeaderByNumber(String blockNumber) async {
    final result = await _request
        .requestRpc(ServiceUrl.getHeaderByNumber, [toHex(blockNumber)]);
    return result == null ? null : Header.fromJson(result);
  }

  //==========================Experiment RPC Methods==================================

  Future<String> computeTransactionHash(Transaction transaction) async {
    return await _request.requestRpc(ServiceUrl.computeTransactionHash, []);
  }

  Future<String> computeScriptHash(Script script) async {
    return await _request.requestRpc(ServiceUrl.computeScriptHash, [script]);
  }

  Future<Cycles> dryRunTransaction(Transaction transaction) async {
    final result = await _request.requestRpc(
        ServiceUrl.dryRunTransaction, [parseTransaction(transaction)]);
    return result == null ? null : Cycles.fromJson(result);
  }

  //==========================Indexer RPC Methods========================================

  Future DeindexLockHash(String lockHash) async {
    await _request.requestRpc(ServiceUrl.deindexLockHash, [lockHash]);
  }

  Future<List<LiveCell>> getLiveCellsByLockHash(
      String lockHash, String page, String size) async {
    final result = await _request.requestRpc(ServiceUrl.getLiveCellsByLockHash,
        [lockHash, toHex(page), toHex(size)]);
    return result == null
        ? null
        : (result as List)
            ?.map((e) =>
                e == null ? null : LiveCell.fromJson(e as Map<String, dynamic>))
            ?.toList();
  }

  Future<List<LockHashIndexState>> getLockHashIndexStates() async {
    final result =
        await _request.requestRpc(ServiceUrl.getLockHashIndexStates, []);
    List<LockHashIndexState> states = result == null
        ? null
        : (result as List)
            ?.map((e) => e == null
                ? null
                : LockHashIndexState.fromJson(e as Map<String, dynamic>))
            ?.toList();
    return states;
  }

  Future<List<TransactionByLockHash>> getTransactionByLockHash(
      String lockHash, String page, String size) async {
    final result = await _request.requestRpc(
        ServiceUrl.getTransactionsByLockHash,
        [lockHash, toHex(page), toHex(size)]);
    return result == null
        ? null
        : (result as List)
            ?.map((e) => e == null
                ? null
                : TransactionByLockHash.fromJson(e as Map<String, dynamic>))
            ?.toList();
  }

  Future<LockHashIndexState> getIndexLockHash(
      String lockHash, String indexFrom) async {
    final result = await _request
        .requestRpc(ServiceUrl.indexLockHash, [lockHash, toHex(indexFrom)]);
    return result == null ? null : LockHashIndexState.fromJson(result);
  }

  //==========================Net RPC Methods============================================

  Future<List<NodeInfo>> getPeers() async {
    final result = await _request.requestRpc(ServiceUrl.getPeers, []);
    return result == null
        ? null
        : (result as List)
            ?.map((e) =>
                e == null ? null : NodeInfo.fromJson(e as Map<String, dynamic>))
            ?.toList();
  }

  Future<NodeInfo> getLocalNodeInfo() async {
    final result = await _request.requestRpc(ServiceUrl.localNodeInfo, []);
    return result == null ? null : NodeInfo.fromJson(result);
  }

  Future setBan(BannedAddress bannedAddress) async {
    await _request.requestRpc(ServiceUrl.setBan, [
      bannedAddress.address,
      bannedAddress.command,
      bannedAddress.banTime,
      bannedAddress.absolute,
      bannedAddress.reason,
    ]);
  }

  Future<List<BannedAddress>> getBannedAddress() async {
    final result = await _request.requestRpc(ServiceUrl.getBannerAddresses, []);
    return result == null
        ? null
        : (result as List)
            ?.map((e) => e == null
                ? null
                : BannedAddress.fromJson(e as Map<String, dynamic>))
            ?.toList();
  }

//================================Pool RPC Methods===============================

  Future<String> sendTransaction(Transaction transaction) async {
    return await _request.requestRpc(
        ServiceUrl.sendTransaction, [parseTransaction(transaction)]);
  }

  Future<TxPoolInfo> txPoolInfo() async {
    final result = await _request.requestRpc(ServiceUrl.txPoolInfo, []);
    return result == null ? null : TxPoolInfo.fromJson(result);
  }

  //=============================States RPC Methods=====================================

  Future<BlockchainInfo> getBlockchainInfo() async {
    final result = await _request.requestRpc(ServiceUrl.getBlockchainInfo, []);
    return result == null ? null : BlockchainInfo.fromJson(result);
  }

  Future<List<PeerState>> getPeersState() async {
    final result = await _request.requestRpc(ServiceUrl.getPeersState, []);
    return result == null
        ? null
        : (result as List)
            ?.map((e) => e == null
                ? null
                : PeerState.fromJson(e as Map<String, dynamic>))
            ?.toList();
  }
}
