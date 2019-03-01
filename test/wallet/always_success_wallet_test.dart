import 'package:test/test.dart';
import 'package:ckb_dart_sdk/ckb-rpc/api_client.dart';
import 'package:ckb_dart_sdk/ckb-wallet/always_success_wallet.dart';
import 'dart:convert';

main() {
  test("test address", () async {
    ApiClient apiClient = ApiClient("http://192.168.2.203:8114/");
    AlwaysSuccessWallet minerWallet = AlwaysSuccessWallet(apiClient);
    Unlock minerUnlock = await minerWallet.getUnlockScript();
    print(jsonEncode(minerUnlock));
    String minerAddress = minerUnlock.getTypeHash();
    print(minerAddress);
  });
}
