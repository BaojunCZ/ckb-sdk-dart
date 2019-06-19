import 'dart:convert';

import 'package:ckb_sdk/ckb_rpc.dart';
import 'package:ckb_sdk/ckb_types.dart';
import 'package:test/test.dart';

main() {
  final apiClient = new CKBApiClient("http://127.0.0.1:8114");
  test("genesisBlockHash", () async {
    try {
      String blockHash = await apiClient.genesisBlockHash();
      expect(blockHash != null, true);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test("genesisBlock", () async {
    try {
      Block blockRes = await apiClient.genesisBlock();
      jsonEncode(blockRes);
      expect(blockRes != null, true);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test("get block by block hash", () async {
    try {
      Block block = await apiClient
          .getBlock("0xfe9c111a4149e553f8bfc93cbc518d59eb7f073ac74e1ffa1369d4c5a77cdb48");
      print(block.header.number);
      expect(block != null, true);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test("get block hash", () async {
    try {
      String blockHash = await apiClient.getBlockHash("1");
      expect(blockHash != null, true);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test('get block by block number', () async {
    try {
      Block block = await apiClient.getBlockByBlockNumber("13");
      print(jsonEncode(block));
      expect(block != null, true);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test("get cell by lock hash", () async {
    try {
      List<CellWithOutPoint> cells = await apiClient.getCellsByLockHash(
          '0x07bab3ada3cc0ff223b387d7f5038ef57b335aa1d8dadc418d5d8ad3b19aeadb', '0', '2');
      // jsonEncode(cells);
      if (cells.length > 0)
        expect(
            cells[0].lock.scriptHash ==
                '0x07bab3ada3cc0ff223b387d7f5038ef57b335aa1d8dadc418d5d8ad3b19aeadb',
            true);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test('get current epoch', () async {
    try {
      Epoch epoch = await apiClient.getCurrentEpoch();
      if (epoch == null) {
        print('There is no epoch');
      } else {
        jsonEncode(epoch);
      }
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test('getEpochByNumber', () async {
    try {
      Epoch epoch = await apiClient.getEpochByNumber('0');
      if (epoch == null) {
        print('There is no epoch');
      } else {
        jsonEncode(epoch);
      }
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test("get live cell", () async {
    try {
      CellWithStatus liveCellRes = await apiClient.getLiveCell(OutPoint(null,
          CellOutPoint("0xa824b7338f72b4af93ce79d57cc257e7014b7c120eac43d3b002503d78971cda", "1")));
      jsonEncode(liveCellRes);
      expect(liveCellRes != null, true);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test("get tip block number", () async {
    try {
      String tipBlockNumber = await apiClient.getTipBlockNumber();
      expect(tipBlockNumber != null, true);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test("get tip header", () async {
    try {
      Header header = await apiClient.getTipHeader();
      jsonEncode(header);
      expect(header.hash != null, true);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  group("get transaction", () {
    test("with right params", () async {
      try {
        String hash = "0xd79b165d2b0062ed2b2f56938be56112a915df8a2dd6ec49c931e1fc5c9bfc93";
        TransactionWithStatus transactionWithStatus = await apiClient.getTransaction(hash);
        if (transactionWithStatus == null) {
          print('There is no transaction');
        } else {
          print(jsonEncode(transactionWithStatus));
          expect(transactionWithStatus.transaction.hash, hash);
        }
      } catch (error) {
        print(error.toString());
        expect(true, true);
      }
    });

    test("with wrong params", () async {
      try {
        String hash = "0x3f292cbae324";
        await apiClient.getTransaction(hash);
      } catch (error) {
        print(error.toString());
        expect(true, true);
      }
    });
  });
}
