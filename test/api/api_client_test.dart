import 'dart:convert';

import 'package:ckb_sdk/ckb_sdk.dart';
import 'package:test/test.dart';

void main() {
  final apiClient = new ApiClient(nodeUrl: "http://47.111.175.189:8123/");

  test("genesisBlockHash", () async {
    try {
      String blockHash = await apiClient.genesisBlockHash();
      print(blockHash);
      expect(blockHash != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("genesisBlock", () async {
    try {
      Block blockRes = await apiClient.genesisBlock();
      print(jsonEncode(blockRes.header));
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
      print(blockHash);
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
      print(header.hash);
      expect(header.hash != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("get cell by lock hash", () async {
    try {
      List<Cell> cells = await apiClient.getCellsByLockHash(
          '0x0da2fe99fe549e082d4ed483c2e968a89ea8d11aabf5d79e5cbf06522de6e674',
          "1",
          "20");
      print(jsonEncode(cells));
      expect(
          cells[0].lock ==
              '0x0da2fe99fe549e082d4ed483c2e968a89ea8d11aabf5d79e5cbf06522de6e674',
          true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("get live cell", () async {
    try {
      CellWithStatus liveCellRes = await apiClient.getLiveCell(new OutPoint(
          "0x8d37f0856ebb70c12871830667d82224e6619896c7f12bb73a14dd9329af9c8d",
          0));
      print(liveCellRes.cell.lock);
      expect(liveCellRes != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("get tip block number", () async {
    try {
      String tipBlockNumber = await apiClient.getTipBlockNumber();
      print(tipBlockNumber);
      expect(tipBlockNumber != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("get local node info", () async {
    try {
      NodeInfo localNodeId = await apiClient.getLocalNodeInfo();
      print(jsonEncode(localNodeId));
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
      print(jsonEncode(block.header));
      expect(block != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test('get trace transaction', () async {
    try {
      List<TraceTransaction> trasactions = await apiClient.getTraceTransaction(
          '0x90d49497a35d5fc90c3558d8690b6fc0a8cb32a95bc89a962b28296b70b3f90a');
      print(trasactions);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("alwaysSuccessCellHash", () async {
    try {
      String cellHash = await apiClient.alwaysSuccessCellHash();
      print(cellHash);
      expect("8bddddc3ae2e09c13106634d012525aa32fc47736456dba11514d352845e561d",
          cellHash);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("alwaysSuccessScriptOutPoint", () async {
    try {
      OutPoint outPoint = await apiClient.alwaysSuccessScriptOutPoint();
      print(outPoint.hash);
      expect(
          "0x8d37f0856ebb70c12871830667d82224e6619896c7f12bb73a14dd9329af9c8d",
          outPoint.hash);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });
}
