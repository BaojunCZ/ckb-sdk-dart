import '../../lib/ckb-wallet/ckb_wallet.dart';
import '../../lib/ckb-rpc/api_client.dart';
import 'dart:convert';

void main() async {
  CkbWallet wallet = CkbWallet(ApiClient("http://192.168.2.203:8114/"),
      "e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3");
  String typeHash = wallet.getAddress();
  print(typeHash);
  try {
    int balance = await wallet.getBalance();
    print(balance);
  } catch (error) {
    print(jsonEncode(error));
  }
}
