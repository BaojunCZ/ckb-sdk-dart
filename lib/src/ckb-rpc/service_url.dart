part of 'package:ckb_sdk/ckb_rpc.dart';

class ServiceUrl {
  static final block = "get_block";
  static final transaction = "get_transaction";
  static final blockHash = "get_block_hash";
  static final tipHeader = "get_tip_header";
  static final cellsByLockHash = "get_cells_by_lock_hash";
  static final liveCell = "get_live_cell";
  static final tipBlockNumber = "get_tip_block_number";
  static final localNodeInfo = "local_node_info";
  static final sendTransaction = "send_transaction";
  static final traceTransaction = "trace_transaction";
  static final getTransactionTrace = "get_transaction_trace";
  static final getBlockByBlockNumber = "get_block_by_number";
  static final getCurrentEpoch = 'get_current_epoch';
  static final getEpochByNumber = 'get_epoch_by_number';
  static final getPeers = 'get_peers';
  static final txPoolInfo = 'tx_pool_info';
  static final getBlockchainInfo = 'get_blockchain_info';
  static final getPeersState = 'get_peers_state';
  static final dryRunTransaction = 'dry_run_transaction';
  static final computeTransactionHash = '_compute_transaction_hash';
}
