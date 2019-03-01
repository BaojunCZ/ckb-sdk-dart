import 'package:test/test.dart';
import 'dart:convert';
import '../../lib/ckb-rpc/api_client.dart';

void main() {
  final apiClient = new ApiClient(nodeUrl: "http://192.168.2.203:8114/");

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
      print(jsonEncode(blockRes));
      expect(blockRes != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("get block hash", () async {
    try {
      String blockHash = await apiClient.getBlockHash(1);
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
            "0x1b5519596b17b8b88321b4bc8cb88e88ced3cc3a19c1300612ad8d021d45aa4a";
        Transaction transaction = await apiClient.getTransaction(hash);
        print(jsonEncode(transaction));
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
        expect(error.code, -1);
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

  test("get cell by type hash", () async {
    try {
      List<Cell> cells = await apiClient.getCellsByTypeHash(
          '0x0da2fe99fe549e082d4ed483c2e968a89ea8d11aabf5d79e5cbf06522de6e674',
          1,
          20);
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
          "0xff50745e53c9af867763834dda3a94fbe833e9318ddb3570a2e914630fcaea17",
          0));
      print(liveCellRes.cell.lock);
      print(jsonEncode(liveCellRes));
      expect(liveCellRes != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("get tip block number", () async {
    try {
      int tipBlockNumber = await apiClient.getTipBlockNumber();
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
      Block block = await apiClient.getBlock(
          '0xb59a3a251076bc6e057d11c7ad0d140810984ef259fa08cdbfe4e2c8db40410f');
      print(block);
      expect(block != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("alwaysSuccessCellHash", () async {
    try {
      String cellHash = await apiClient.alwaysSuccessCellHash();
      expect("be53efec824349f8b8bd9cfa93ccee25c6e1d544e6bd686f720a4c27d933cd71",
          cellHash);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("alwaysSuccessScriptOutPoint", () async {
    try {
      OutPoint outPoint = await apiClient.alwaysSuccessScriptOutPoint();
      expect(
          "0x15c809f08c7bca63d2b661e1dbc26c74551a6f982f7631c718dc43bd2bb5c90e",
          outPoint.hash);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });
}
