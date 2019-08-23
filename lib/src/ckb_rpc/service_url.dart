part of 'package:ckb_sdk/ckb_rpc.dart';

class ServiceUrl {
  //Chain
  static final block = "get_block";
  static final getBlockByBlockNumber = "get_block_by_number";
  static final blockHash = "get_block_hash";
  static final cellsByLockHash = "get_cells_by_lock_hash";
  static final getCurrentEpoch = 'get_current_epoch';
  static final getEpochByNumber = 'get_epoch_by_number';
  static final liveCell = "get_live_cell";
  static final tipBlockNumber = "get_tip_block_number";
  static final tipHeader = "get_tip_header";
  static final transaction = "get_transaction";
  static final cellbaseOutputCapacity = "get_cellbase_output_capacity_details";
  static final getHeader = "get_header";
  static final getHeaderByNumber = "get_header_by_number";

  //Experiment
  static final computeTransactionHash = '_compute_transaction_hash';
  static final computeScriptHash = '_compute_script_hash';
  static final dryRunTransaction = 'dry_run_transaction';

  //Indexer
  static final deindexLockHash = 'deindex_lock_hash';
  static final getLiveCellsByLockHash = 'get_live_cells_by_lock_hash';
  static final getLockHashIndexStates = 'get_lock_hash_index_states';
  static final getTransactionsByLockHash = 'get_transactions_by_lock_hash';
  static final indexLockHash = 'index_lock_hash';

  //Net
  static final getPeers = 'get_peers';
  static final localNodeInfo = "local_node_info";
  static final setBan = "set_ban";
  static final getBannerAddresses = "get_banned_addresses";

  //Pool
  static final sendTransaction = "send_transaction";
  static final txPoolInfo = 'tx_pool_info';

  //States
  static final getBlockchainInfo = 'get_blockchain_info';
  static final getPeersState = 'get_peers_state';
}
