import 'package:test/test.dart';
import 'dart:convert';
import '../../lib/ckb-rpc/api_client.dart';

void main() {
  final apiClient = new ApiClient("http://192.168.2.203:8114/");

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
      expect(blockRes != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("get block hash", () async {
    try {
      String blockHash = await apiClient.getBlockHash(1);
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
            "0x3dbab447d2eed8bdbf9038752fe1264aa2b5bcc8231c4df95d300b1a665bd01a";
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
          '0xc0a0565adcb163db486528b9d3b74485637138d99803aebc9e2055a95e866e98',
          1,
          375);
      print(jsonEncode(cells));
      expect(
          cells[0].lock ==
              '0xc0a0565adcb163db486528b9d3b74485637138d99803aebc9e2055a95e866e98',
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

  test("get local node id", () async {
    try {
      String localNodeId = await apiClient.getLocalNodeId();
      print(localNodeId);
      expect(localNodeId != null, true);
    } catch (error) {
      print(error.message);
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
