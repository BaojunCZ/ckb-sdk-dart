/*
 * @Author: BaojunCZ
 * @Date: 2019-01-09 16:22:23
 * @LastEditors: your name
 * @LastEditTime: 2019-03-08 15:29:01
 * @Description: RPC url
 */
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
}
