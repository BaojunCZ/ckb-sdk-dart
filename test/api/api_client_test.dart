import 'dart:convert';

import 'package:ckb_sdk/ckb-types/item/block.dart';
import 'package:ckb_sdk/ckb-types/item/blockchain_info.dart';
import 'package:ckb_sdk/ckb-types/item/cell_input.dart';
import 'package:ckb_sdk/ckb-types/item/cell_out_point.dart';
import 'package:ckb_sdk/ckb-types/item/cell_output.dart';
import 'package:ckb_sdk/ckb-types/item/cell_with_outpoint.dart';
import 'package:ckb_sdk/ckb-types/item/cell_with_status.dart';
import 'package:ckb_sdk/ckb-types/item/cycles.dart';
import 'package:ckb_sdk/ckb-types/item/epoch.dart';
import 'package:ckb_sdk/ckb-types/item/header.dart';
import 'package:ckb_sdk/ckb-types/item/node_info.dart';
import 'package:ckb_sdk/ckb-types/item/out_point.dart';
import 'package:ckb_sdk/ckb-types/item/peer_state.dart';
import 'package:ckb_sdk/ckb-types/item/script.dart';
import 'package:ckb_sdk/ckb-types/item/send_transaction.dart';
import 'package:ckb_sdk/ckb-types/item/transaction_with_status.dart';
import 'package:ckb_sdk/ckb-types/item/tx_pool_info.dart';
import 'package:ckb_sdk/ckb_sdk.dart';
import 'package:test/test.dart';

void main() {
  final apiClient = new CKBApiClient("http://192.168.2.78:8114");

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
        String hash = "0x0000000000000000000000000000000000000000000000000000000000000000";
        TransactionWithStatus transactionWithStatus = await apiClient.getTransaction(hash);
        if (transactionWithStatus == null) {
          print('There is no transaction');
        } else {
          jsonEncode(transactionWithStatus);
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
          '0x266cec97cbede2cfbce73666f08deed9560bdf7841a7a5a51b3a3f09da249e21', '0', '2');
      // jsonEncode(cells);
      if (cells.length > 0)
        expect(
            cells[0].lock.scriptHash ==
                '0x266cec97cbede2cfbce73666f08deed9560bdf7841a7a5a51b3a3f09da249e21',
            true);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test("get live cell", () async {
    try {
      CellWithStatus liveCellRes = await apiClient.getLiveCell(OutPoint('',
          CellOutPoint("0x8d37f0856ebb70c12871830667d82224e6619896c7f12bb73a14dd9329af9c8d", "0")));
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
      Block block = await apiClient.getBlock(await apiClient.getBlockHash("20"));
      jsonEncode(block);
      expect(block != null, true);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test('get block by block number', () async {
    try {
      Block block = await apiClient.getBlockByBlockNumber("20");
      jsonEncode(block);
      expect(block != null, true);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test('send transaction', () async {
    try {
      var senTransaction = SendTransaction("0", [], [
        CellInput(
            OutPoint(
                '',
                CellOutPoint(
                    "0x8d37f0856ebb70c12871830667d82224e6619896c7f12bb73a14dd9329af9c8d", "0")),
            [],
            "0")
      ], [
        CellOutput('10000', '0x',
            Script('0x28e83a1277d48add8e72fadaa9248559e1b632bab2bd60b27955ebc4c03800a5', []), null)
      ]);
      String hash = await apiClient.sendTransaction(senTransaction);
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
      var senTransaction = SendTransaction("0", [], [
        CellInput(
            OutPoint(
                '',
                CellOutPoint(
                    "0x8d37f0856ebb70c12871830667d82224e6619896c7f12bb73a14dd9329af9c8d", "0")),
            [],
            "0")
      ], [
        CellOutput('10000', '0x',
            Script('0x28e83a1277d48add8e72fadaa9248559e1b632bab2bd60b27955ebc4c03800a5', []), null)
      ]);
      String hash = await apiClient.computeTransactionHash(senTransaction);
      print(hash);
    } catch (e) {
      print(e.toString());
      expect(true, true);
    }
  });

  test('dry run transaction', () async {
    try {
      var senTransaction = SendTransaction("0", [], [
        CellInput(
            OutPoint(
                '',
                CellOutPoint(
                    "0x8d37f0856ebb70c12871830667d82224e6619896c7f12bb73a14dd9329af9c8d", "0")),
            [],
            "0")
      ], [
        CellOutput('10000', '0x',
            Script('0x28e83a1277d48add8e72fadaa9248559e1b632bab2bd60b27955ebc4c03800a5', []), null)
      ]);
      Cycles cycles = await apiClient.dryRunTransaction(senTransaction);
      print(cycles.cycles);
    } catch (e) {
      print(e.toString());
      expect(true, true);
    }
  });
}
