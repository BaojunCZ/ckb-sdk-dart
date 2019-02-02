import '../ckb-rpc/api_client.dart';
import './wallet_manager.dart';
import './credential.dart';

class CkbWallet {
  String address;
  Credential credential;
  WalletManager _manager;

  CkbWallet(ApiClient apiClient, String privateKey) {
    credential = Credential.fromPrivateKeyHex(privateKey);
    _manager = WalletManager.init(apiClient, credential);
    address = _manager.getAddress();
  }

  Future<int> getBalance() async {
    List<Cell> unspentCells = await _manager.getUnspentCells(address);
    int balance = 0;
    unspentCells.forEach((cell) {
      balance += cell.capacity;
    });
    return balance;
  }

  String getAddress() {
    return _manager.getAddress();
  }
}
