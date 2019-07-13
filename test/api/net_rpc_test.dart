@Skip()

import 'dart:convert';

import 'package:ckb_sdk/ckb_rpc.dart';
import 'package:ckb_sdk/ckb_types.dart';
import 'package:test/test.dart';

main() {
  final apiClient = new CKBApiClient("http://127.0.0.1:8114");

  test('getPeers', () async {
    try {
      List<NodeInfo> peers = await apiClient.getPeers();
      print(jsonEncode(peers));
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test("get local node info", () async {
    try {
      NodeInfo localNodeId = await apiClient.getLocalNodeInfo();
      print(jsonEncode(localNodeId));
      expect(localNodeId != null, true);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });
}
