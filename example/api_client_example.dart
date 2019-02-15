import '../lib/ckb_sdk_dart.dart';
import 'dart:convert';

main() async {
  final apiClient = new ApiClient("http://192.168.2.203:8114/");
  String blockHash = await apiClient.getBlockHash(1);
  // print(blockHash.error.message);
  print(blockHash);

  Transaction transaction = await apiClient.getTransaction(
      "0x3abd21e6e51674bb961bb4c5f3cee9faa5da30e64be10628dc1cef292cbae324");
  List<CellOutput> cellOutputs = transaction.outputs;
  print(jsonEncode(cellOutputs));

  Header header = await apiClient.getTipHeader();
  print(header.cellbaseId);

  List<Cell> cells = await apiClient.getCellsByTypeHash(
      '0x0da2fe99fe549e082d4ed483c2e968a89ea8d11aabf5d79e5cbf06522de6e674',
      1,
      1000);
  Cell cell = cells[0];
  OutPoint point = cell.outPoint;
  print(point.hash);
  print(point.index);

  CellWithStatus liveCellRes = await apiClient.getLiveCell(new OutPoint(
      "0xff50745e53c9af867763834dda3a94fbe833e9318ddb3570a2e914630fcaea17", 0));
  print(liveCellRes.cell.capacity);

  int tipBlockNumber = await apiClient.getTipBlockNumber();
  print(tipBlockNumber);

  String localNodeId = await apiClient.getLocalNodeId();
  print(localNodeId);

  Block block = await apiClient.getBlock(
      '0xdc3b61fe382b3a6297453a712ca2d2581b254f62baab509c35e50b2d09c25702');
  print(jsonEncode(block));

  String transationHash =
      await apiClient.sendTransaction(new SendTransaction([], [], [], 2));
  print(transationHash);

  String cellHash = await apiClient.alwaysSuccessCellHash();
  print(cellHash);

  OutPoint outPoint = await apiClient.alwaysSuccessScriptOutPoint();
  print(outPoint.toJson());
}
