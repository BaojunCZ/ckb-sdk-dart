import 'dart:convert';

import 'package:ckb_sdk/ckb_sdk.dart';
import 'package:test/test.dart';

void main() {
  final apiClient = new ApiClient(nodeUrl: "http://47.245.29.58:8121/");

  test("genesisBlockHash", () async {
    try {
      String blockHash = await apiClient.genesisBlockHash();
      expect(blockHash != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("genesisBlock", () async {
    try {
      Block blockRes = await apiClient.genesisBlock();
      jsonEncode(blockRes);
      print(blockRes.commitTransactions[0].hash);
      expect(blockRes != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("get block hash", () async {
    try {
      String blockHash = await apiClient.getBlockHash("1");
      expect(blockHash != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  group("get transaction", () {
    test("with right params", () async {
      try {
        String hash =
            "0x81cad3cb9b5b74a0b485f8ac2e6dc6c0747b728b8fb75393ce80e9487242a57a";
        Transaction transaction = await apiClient.getTransaction(hash);
        jsonEncode(transaction);
        expect(transaction.hash, hash);
      } catch (error) {
        print(error.message);
        expect(error.code, -1);
      }
    });

    test("with wrong params", () async {
      try {
        String hash = "0x3f292cbae324";
        Transaction transaction = await apiClient.getTransaction(hash);
        expect(transaction.hash, hash);
      } catch (error) {
        print(error.message);
        expect(error.code, -32602);
      }
    });
  });

  test("get tip header", () async {
    try {
      Header header = await apiClient.getTipHeader();
      jsonEncode(header);
      expect(header.hash != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  // test("get cell by lock hash", () async {
  //   try {
  //     List<Cell> cells = await apiClient.getCellsByLockHash(
  //         '0x0da2fe99fe549e082d4ed483c2e968a89ea8d11aabf5d79e5cbf06522de6e674',
  //         "1",
  //         "20");
  //     jsonEncode(cells);
  //     expect(
  //         cells[0].lock ==
  //             '0x0da2fe99fe549e082d4ed483c2e968a89ea8d11aabf5d79e5cbf06522de6e674',
  //         true);
  //   } catch (error) {
  //     print(error.message);
  //     expect(error.code, -1);
  //   }
  // });

  test("get live cell", () async {
    try {
      CellWithStatus liveCellRes = await apiClient.getLiveCell(new OutPoint(
          "0x8d37f0856ebb70c12871830667d82224e6619896c7f12bb73a14dd9329af9c8d",
          0));
      jsonEncode(liveCellRes);
      expect(liveCellRes != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("get tip block number", () async {
    try {
      String tipBlockNumber = await apiClient.getTipBlockNumber();
      expect(tipBlockNumber != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("get local node info", () async {
    try {
      NodeInfo localNodeId = await apiClient.getLocalNodeInfo();
      jsonEncode(localNodeId);
      expect(localNodeId != null, true);
    } catch (error) {
      print(error);
      expect(error.code, -1);
    }
  });

  test("get block", () async {
    try {
      Block block =
          await apiClient.getBlock(await apiClient.getBlockHash("20"));
      jsonEncode(block);
      expect(block != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  // test('get trace transaction', () async {
  //   try {
  //     List<TraceTransaction> transactions = await apiClient.getTraceTransaction(
  //         '0x81cad3cb9b5b74a0b485f8ac2e6dc6c0747b728b8fb75393ce80e9487242a57a');
  //     print(transactions);
  //     expect(transactions.length, 0);
  //   } catch (error) {
  //     print(error.message);
  //     expect(error.code, -1);
  //   }
  // });
}
