import 'dart:convert';

import 'package:ckb_sdk/ckb_rpc.dart';
import 'package:ckb_sdk/ckb_types.dart';
import 'package:test/test.dart';

void main() {
  final apiClient = new CKBApiClient("http://127.0.0.1:8114");

  test('getBlockchainInfo', () async {
    try {
      BlockchainInfo blockchainInfo = await apiClient.getBlockchainInfo();
      print(jsonEncode(blockchainInfo));
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });

  test('getPeersState', () async {
    try {
      List<PeerState> peersState = await apiClient.getPeersState();
      print(jsonEncode(peersState));
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });
}
