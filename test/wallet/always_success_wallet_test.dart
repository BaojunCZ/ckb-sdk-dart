import 'package:test/test.dart';
import '../../lib/ckb-rpc/api_client.dart';
import '../../lib/ckb-wallet/always_success_wallet.dart';
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
