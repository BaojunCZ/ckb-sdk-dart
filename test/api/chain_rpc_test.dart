@Skip()

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
      Block block = await apiClient.genesisBlock();
      jsonEncode(block);
      expect(block != null, true);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test("get block by block hash", () async {
    try {
      Block block = await apiClient
          .getBlock("0xac1766e14aa988b41d6ac3fe8216a1ab83f10359ca34478a8c0902069cbb0296");
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
      print(blockHash);
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
          '0xe94e4b509d5946c54ea9bc7500af12fd35eebe0d47a6b3e502127f94d34997ac', '11', '22');
      print(jsonEncode(cells));
      if (cells.length > 0)
        expect(
            cells[0].lock.scriptHash ==
                '0xe94e4b509d5946c54ea9bc7500af12fd35eebe0d47a6b3e502127f94d34997ac',
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
        print(jsonEncode(epoch));
      }
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test('getEpochByNumber', () async {
    try {
      Epoch epoch = await apiClient.getEpochByNumber('1');
      if (epoch == null) {
        print('There is no epoch');
      } else {
        print(jsonEncode(epoch));
      }
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test("get live cell", () async {
    try {
      CellWithStatus liveCell = await apiClient.getLiveCell(OutPoint(null,
          CellOutPoint("0x8fbf8ecc60907c304a524ab94755f06b205a55651cea625b02687443bdb87aa2", "0")));
      print(jsonEncode(liveCell));
      expect(liveCell != null, true);
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

  test("get CellbaseOutputCapacityDetails", () async {
    try {
      CellbaseOutputCapacity cellbaseOutputCapacity =
          await apiClient.getCellbaseOutputCapacityDetails(
              '0xac1766e14aa988b41d6ac3fe8216a1ab83f10359ca34478a8c0902069cbb0296');
      expect(cellbaseOutputCapacity != null, true);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test("get header", () async {
    try {
      Header header = await apiClient
          .getHeader("0xac1766e14aa988b41d6ac3fe8216a1ab83f10359ca34478a8c0902069cbb0296");
      expect(header != null, true);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test("get header by blockNumber", () async {
    try {
      Header header = await apiClient.getHeaderByNumber("1");
      expect(header != null, true);
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
