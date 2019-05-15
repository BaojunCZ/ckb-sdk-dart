/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 13:10:13
 * @LastEditors: your name
 * @LastEditTime: 2019-03-12 13:24:40
 * @Description: json rpc api client
 */
import 'package:ckb_sdk/ckb-rpc/api_request.dart';
import 'package:ckb_sdk/ckb-rpc/service_url.dart';
import 'package:ckb_sdk/ckb-types/block_res.dart';
import 'package:ckb_sdk/ckb-types/blockchain_info_res.dart';
import 'package:ckb_sdk/ckb-types/blockhash_res.dart';
import 'package:ckb_sdk/ckb-types/cells_by_lock_hash_res.dart';
import 'package:ckb_sdk/ckb-types/compute_transaction_hash_res.dart';
import 'package:ckb_sdk/ckb-types/dry_run_transaction_res.dart';
import 'package:ckb_sdk/ckb-types/epoch_res.dart';
import 'package:ckb_sdk/ckb-types/header_res.dart';
import 'package:ckb_sdk/ckb-types/item/block.dart';
import 'package:ckb_sdk/ckb-types/item/blockchain_info.dart';
import 'package:ckb_sdk/ckb-types/item/cell_with_outpoint.dart';
import 'package:ckb_sdk/ckb-types/item/cell_with_status.dart';
import 'package:ckb_sdk/ckb-types/item/cycles.dart';
import 'package:ckb_sdk/ckb-types/item/epoch.dart';
import 'package:ckb_sdk/ckb-types/item/header.dart';
import 'package:ckb_sdk/ckb-types/item/node_info.dart';
import 'package:ckb_sdk/ckb-types/item/out_point.dart';
import 'package:ckb_sdk/ckb-types/item/peer_state.dart';
import 'package:ckb_sdk/ckb-types/item/transaction.dart';
import 'package:ckb_sdk/ckb-types/item/transaction_with_status.dart';
import 'package:ckb_sdk/ckb-types/item/tx_pool_info.dart';
import 'package:ckb_sdk/ckb-types/live_cell_res.dart';
import 'package:ckb_sdk/ckb-types/local_node_info_res.dart';
import 'package:ckb_sdk/ckb-types/peer_state_res.dart';
import 'package:ckb_sdk/ckb-types/peers_res.dart';
import 'package:ckb_sdk/ckb-types/send_transaction_res.dart';
import 'package:ckb_sdk/ckb-types/tip_block_number_res.dart';
import 'package:ckb_sdk/ckb-types/transaction_res.dart';
import 'package:ckb_sdk/ckb-types/tx_pool_info_res.dart';

class CKBApiClient {
  ApiRequest _request;

  CKBApiClient(String nodeUrl) {
    _request = ApiRequest(nodeUrl);
  }

  Future<String> genesisBlockHash() async {
    return await getBlockHash("0");
  }

  Future<Block> genesisBlock() async {
    return await getBlock(await genesisBlockHash());
  }

  //==============================Chain RPC Methods================================

  Future<String> getBlockHash(String blockNumber) async {
    return BlockHashRes.fromJson(await _request.requestRpc(ServiceUrl.blockHash, [blockNumber]))
        .result;
  }

  Future<TransactionWithStatus> getTransaction(String hash) async {
    return TransactionRes.fromJson(await _request.requestRpc(ServiceUrl.transaction, [hash]))
        .result;
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

  //================================Pool RPC Methods===============================

  Future<String> sendTransaction(Transaction transaction) async {
    return SendTransactionRes.fromJson(
            await _request.requestRpc(ServiceUrl.sendTransaction, [transaction]))
        .result;
  }

  Future<Cycles> dryRunTransaction(Transaction transaction) async {
    return DryRunTransactionRes.fromJson(
            await _request.requestRpc(ServiceUrl.dryRunTransaction, transaction))
        .result;
  }

  Future<String> computeTransactionHash(Transaction transaction) async {
    return ComputeTransactionHashRes.fromJson(
            await _request.requestRpc(ServiceUrl.computeTransactionHash, transaction))
        .result;
  }

  Future<TxPoolInfo> txPoolInfo() async {
    return TxPoolInfoRes.fromJson(await _request.requestRpc(ServiceUrl.txPoolInfo, [])).result;
  }
}
