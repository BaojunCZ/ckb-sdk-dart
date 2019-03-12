import 'dart:convert';

import 'package:test/test.dart';
import 'package:ckb_sdk/ckb-wallet/always_success_wallet.dart';
import 'package:ckb_sdk/ckb-types/item/unlock.dart';

main() {
  test("test address", () async {
    AlwaysSuccessWallet minerWallet = AlwaysSuccessWallet();
    Unlock minerUnlock = await minerWallet.getUnlockScript();
    print(jsonEncode(minerUnlock));
    String minerAddress = minerUnlock.getTypeHash();
    print(minerAddress);
  });
}
