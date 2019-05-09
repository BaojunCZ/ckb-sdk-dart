import 'dart:convert';

import 'package:ckb_sdk/ckb-rpc/ckb_api_client.dart';
import 'package:ckb_sdk/ckb-types/item/transaction_with_status.dart';
import 'package:ckb_sdk/ckb_sdk.dart';

main() async {
  final apiClient = new CKBApiClient();
  String blockHash = await apiClient.getBlockHash("1");
  // print(blockHash.error.message);
  print(blockHash);

  TransactionWithStatus transactionWithStatus =
      await apiClient.getTransaction("0x3abd21e6e51674bb961bb4c5f3cee9faa5da30e64be10628dc1cef292cbae324");
  List<CellOutput> cellOutputs = transactionWithStatus.transaction.outputs;
  print(jsonEncode(cellOutputs));

  Header header = await apiClient.getTipHeader();
  print(header.number);

  List<CellWithOutPoint> cells = await apiClient.getCellsByLockHash(
      '0x0da2fe99fe549e082d4ed483c2e968a89ea8d11aabf5d79e5cbf06522de6e674', "1", "1000");
  CellWithOutPoint cell = cells[0];
  OutPoint point = cell.outPoint;
  print(point.cell.txHash);
  print(point.cell.index);

  CellWithStatus liveCellRes = await apiClient
      .getLiveCell(OutPoint('', CellOutPoint("0x8d37f0856ebb70c12871830667d82224e6619896c7f12bb73a14dd9329af9c8d", 0)));
  print(liveCellRes.cell.capacity);

  String tipBlockNumber = await apiClient.getTipBlockNumber();
  print(tipBlockNumber);

  NodeInfo localNodeInfo = await apiClient.getLocalNodeInfo();
  print(jsonEncode(localNodeInfo));

  Block block = await apiClient.getBlock('0xdc3b61fe382b3a6297453a712ca2d2581b254f62baab509c35e50b2d09c25702');
  print(jsonEncode(block));

  String transationHash = await apiClient.sendTransaction(new SendTransaction([], [], [], 2));
  print(transationHash);
}
