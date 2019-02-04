import '../ckb-rpc/api_client.dart';
import './credential.dart';
import 'dart:math';

class CkbWallet {
  Credential _credential;
  ApiClient _apiClient;

  CkbWallet(ApiClient apiClient, Credential credential) {
    _credential = credential;
    _apiClient = apiClient;
  }

  Credential getCredential() {
    return _credential;
  }

  setCredential(Credential credential) {
    _credential = credential;
  }

  Future<List<Cell>> getUnspentCells(String address) async {
    List<Cell> results = [];
    int toBlockNo = await _apiClient.getTipBlockNumber();
    int fromBlockNo = 1;
    while (fromBlockNo <= toBlockNo) {
      int currentToBlockNumber = min(fromBlockNo + 100, toBlockNo);
      List<Cell> cells = await _apiClient.getCellsByTypeHash(
          address, fromBlockNo, currentToBlockNumber);
      if (!cells.isEmpty) {
        results.addAll(cells);
      }
      fromBlockNo = currentToBlockNumber + 1;
    }
    return results;
  }

  Future<int> getBalance(String address) async {
    List<Cell> unspentCells = await getUnspentCells(address);
    int balance = 0;
    unspentCells.forEach((cell) {
      balance += cell.capacity;
    });
    return balance;
  }
}
