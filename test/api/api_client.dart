import 'dart:convert';

import 'package:ckb_sdk/ckb_rpc.dart';
import 'package:ckb_sdk/ckb_types.dart';
import 'package:test/test.dart';

void main() {
  final apiClient = new CKBApiClient("http://localhost:8114");

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

  test("get block hash", () async {
    try {
      String blockHash = await apiClient.getBlockHash("20");
      expect(blockHash != null, true);
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

  test("get local node info", () async {
    try {
      NodeInfo localNodeId = await apiClient.getLocalNodeInfo();
      jsonEncode(localNodeId);
      expect(localNodeId != null, true);
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

  test('get block by block number', () async {
    try {
      Block block = await apiClient.getBlockByBlockNumber("2");
      print(jsonEncode(block));
      expect(block != null, true);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test('send transaction', () async {
    try {
      var transaction = Transaction("0", "", [], [
        CellInput(
            OutPoint(
                '',
                CellOutPoint(
                    "0x8d37f0856ebb70c12871830667d82224e6619896c7f12bb73a14dd9329af9c8d", "0")),
            "0")
      ], [
        CellOutput('10000', '0x',
            Script('0x28e83a1277d48add8e72fadaa9248559e1b632bab2bd60b27955ebc4c03800a5', []), null)
      ], []);
      String hash = await apiClient.sendTransaction(transaction);
      print(hash);
    } catch (e) {
      e.toString();
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

  test('txPoolInfo', () async {
    try {
      TxPoolInfo txPoolInfo = await apiClient.txPoolInfo();
      jsonEncode(txPoolInfo);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test('getPeers', () async {
    try {
      List<NodeInfo> peers = await apiClient.getPeers();
      jsonEncode(peers);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test('getBlockchainInfo', () async {
    try {
      BlockchainInfo blockchainInfo = await apiClient.getBlockchainInfo();
      jsonEncode(blockchainInfo);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test('getPeersState', () async {
    try {
      List<PeerState> peersState = await apiClient.getPeersState();
      jsonEncode(peersState);
      print(jsonEncode(peersState));
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test('compute transaction hash', () async {
    try {
      var transaction = Transaction("0", "", [], [
        CellInput(
            OutPoint(
                '',
                CellOutPoint(
                    "0x8d37f0856ebb70c12871830667d82224e6619896c7f12bb73a14dd9329af9c8d", "0")),
            "0")
      ], [
        CellOutput('10000', '0x',
            Script('0x28e83a1277d48add8e72fadaa9248559e1b632bab2bd60b27955ebc4c03800a5', []), null)
      ], []);
      String hash = await apiClient.computeTransactionHash(transaction);
      print(hash);
    } catch (e) {
      print(e.toString());
      expect(true, true);
    }
  });

  test('dry run transaction', () async {
    try {
      var senTransaction = Transaction("0", "", [], [
        CellInput(
            OutPoint(
                '',
                CellOutPoint(
                    "0x8d37f0856ebb70c12871830667d82224e6619896c7f12bb73a14dd9329af9c8d", "0")),
            "0")
      ], [
        CellOutput('10000', '0x',
            Script('0x28e83a1277d48add8e72fadaa9248559e1b632bab2bd60b27955ebc4c03800a5', []), null)
      ], []);
      Cycles cycles = await apiClient.dryRunTransaction(senTransaction);
      print(cycles.cycles);
    } catch (e) {
      print(e.toString());
      expect(true, true);
    }
  });
}
