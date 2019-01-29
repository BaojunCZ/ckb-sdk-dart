import 'package:test/test.dart';
import '../../lib/api/api_client.dart';

void main() {
  final apiClient = new ApiClient("http://192.168.2.203:8114/");

  test("genesisBlockHash", () async {
    try {
      BlockHashRes blockHashRes = await apiClient.genesisBlockHash();
      expect(blockHashRes.result != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("genesisBlock", () async {
    try {
      BlockRes blockRes = await apiClient.genesisBlock();
      expect(blockRes.result != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("get block hash", () async {
    try {
      BlockHashRes blockHashRes = await apiClient.getBlockHash(1);
      expect(blockHashRes.result != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  group("get transaction", () {
    test("with right params", () async {
      String hash =
          "0x3abd21e6e51674bb961bb4c5f3cee9faa5da30e64be10628dc1cef292cbae324";
      TransationRes transaction = await apiClient.getTransaction(hash);
      if (transaction.error == null) {
        expect(transaction.result.hash, hash);
      } else {
        print(transaction.error.message);
        expect(transaction.error.code, -1);
      }
    });

    test("with wrong params", () async {
      String hash = "0x3f292cbae324";
      TransationRes transaction = await apiClient.getTransaction(hash);
      if (transaction.error == null) {
        expect(transaction.result.hash, hash);
      } else {
        print(transaction.error.message);
        expect(transaction.error.code, -1);
      }
    });
  });

  test("get tip header", () async {
    try {
      HeaderRes headerRes = await apiClient.getTipHeader();
      print(headerRes.result.hash);
      expect(headerRes.result.hash != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("get cell by type hash", () async {
    try {
      CellsByTypeHash cells = await apiClient.getCellsByTypeHash(
          '0x0da2fe99fe549e082d4ed483c2e968a89ea8d11aabf5d79e5cbf06522de6e674',
          1,
          3);
      expect(
          cells.result[0].lock ==
              '0x0da2fe99fe549e082d4ed483c2e968a89ea8d11aabf5d79e5cbf06522de6e674',
          true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("get live cell", () async {
    try {
      LiveCellRes liveCellRes = await apiClient.getLiveCell(new OutPoint(
          "0x3abd21e6e51674bb961bb4c5f3cee9faa5da30e64be10628dc1cef292cbae324",
          0));
      print(liveCellRes.result.cell.lock);
      expect(liveCellRes.result != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("get tip block number", () async {
    try {
      TipBlockNumberRes tipBlockNumber = await apiClient.getTipBlockNumber();
      print(tipBlockNumber.result);
      expect(tipBlockNumber.result != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("get local node id", () async {
    try {
      LocalNodeIdRes localNodeId = await apiClient.getLocalNodeId();
      print(localNodeId.result);
      expect(localNodeId.result != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("get block", () async {
    try {
      BlockRes blockRes = await apiClient.getBlock(
          '0xb59a3a251076bc6e057d11c7ad0d140810984ef259fa08cdbfe4e2c8db40410f');
      print(blockRes.result);
      expect(blockRes.result != null, true);
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
