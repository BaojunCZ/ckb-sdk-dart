import '../lib/ckb_dart_sdk.dart';

main() async {
  final MyRequest = new Request();
  BlockHashRes blockHash = await MyRequest.getBlockHash(1);
  // print(blockHash.error.message);
  print(blockHash.result);

  TransationRes transaction = await MyRequest.getTransaction(
      "0x3abd21e6e51674bb961bb4c5f3cee9faa5da30e64be10628dc1cef292cbae324");
  var cellOutput = transaction.result.outputs[0];
  print(cellOutput.capacity);

  HeaderRes header = await MyRequest.getTipHeader();
  print(header.result.cellbaseId);

  CellsByTypeHash cells = await MyRequest.getCellsByTypeHash(
      '0x0da2fe99fe549e082d4ed483c2e968a89ea8d11aabf5d79e5cbf06522de6e674',
      1,
      3);
  Cell cell = cells.result[0];
  OutPoint point = cell.outPoint;
  print(point.hash);
}
