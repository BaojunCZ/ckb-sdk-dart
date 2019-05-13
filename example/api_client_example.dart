import 'dart:convert';

import 'package:ckb_sdk/ckb-rpc/ckb_api_client.dart';
import 'package:ckb_sdk/ckb-types/item/transaction_with_status.dart';
import 'package:ckb_sdk/ckb_sdk.dart';

main() async {
  final apiClient = new CKBApiClient('http://192.168.2.78:8114');

  String genesisbBlockHash = await apiClient.genesisBlockHash();
  print(genesisbBlockHash);
  Block blockRes = await apiClient.genesisBlock();
  print(jsonEncode(blockRes));
  String blockHash = await apiClient.getBlockHash("20");
  print(blockHash);
  TransactionWithStatus transactionWithStatus =
      await apiClient.getTransaction('0x3abd21e6e51674bb961bb4c5f3cee9faa5da30e64be10628dc1cef292cbae324');
  print(jsonEncode(transactionWithStatus));
  Header header = await apiClient.getTipHeader();
  print(jsonEncode(header));
  List<CellWithOutPoint> cells = await apiClient.getCellsByLockHash(
      '0x266cec97cbede2cfbce73666f08deed9560bdf7841a7a5a51b3a3f09da249e21', '0', '2');
  print(jsonEncode(cells));
  CellWithStatus liveCellRes = await apiClient
      .getLiveCell(new OutPoint("0x8d37f0856ebb70c12871830667d82224e6619896c7f12bb73a14dd9329af9c8d", 0));
  print(jsonEncode(liveCellRes));
  String tipBlockNumber = await apiClient.getTipBlockNumber();
  print(tipBlockNumber);
  NodeInfo localNodeId = await apiClient.getLocalNodeInfo();
  print(jsonEncode(localNodeId));
  Block block = await apiClient.getBlock(await apiClient.getBlockHash("20"));
  print(jsonEncode(block));
  Block blockByNumber = await apiClient.getBlockByBlockNumber("20");
  print(jsonEncode(blockByNumber));
}
