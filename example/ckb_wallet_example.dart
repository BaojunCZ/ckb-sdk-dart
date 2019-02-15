import '../lib/ckb-wallet/always_success_wallet.dart';
import '../lib/ckb-wallet/ckb_wallet.dart';
import '../lib/ckb-rpc/api_client.dart';
import '../lib/ckb-wallet/credential.dart';
import 'dart:io';
import 'dart:convert';

main() async {
  try {
    String _MRUBY_CELL_HASH = "0x2165b10c4f6c55302158a17049b9dad4fef0acaf1065c63c02ddeccbce97ac47";
    String _MRUBY_OUT_POINT_HASH = "0xff50745e53c9af867763834dda3a94fbe833e9318ddb3570a2e914630fcaea17";
    ApiClient apiClient = ApiClient("http://192.168.2.203:8114/");
    Credential bobCredential =
        Credential.fromPrivateKeyHex("e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3");
    Credential aliceCredential =
        Credential.fromPrivateKeyHex("76e853efa8245389e33f6fe49dcbd359eb56be2f6c3594e12521d2a806d32156");

    AlwaysSuccessWallet minerWallet = AlwaysSuccessWallet(apiClient);
    Unlock minerUnlock = await minerWallet.getUnlockScript();
    String minerAddress = minerUnlock.getTypeHash();
    int minerBalance = await minerWallet.getBalance(minerAddress);
    print("miner`s address is ${minerAddress} and balance is ${minerBalance}");

    CkbWallet bobWallet = CkbWallet(apiClient, bobCredential);
    bobWallet.setMRUBY_OUT_POINT_HASH(_MRUBY_OUT_POINT_HASH);
    Unlock bobUnlock = bobCredential.getUnlockScript('res/bitcoin_unlock.rb', reference: _MRUBY_CELL_HASH);
    String bobAddress = bobCredential.getAddress(bobUnlock);
    int bobBalance = await bobWallet.getBalance(bobAddress);
    print("bob`s address is ${bobAddress} and balance is ${bobBalance}");

    CkbWallet aliceWallet = CkbWallet(apiClient, aliceCredential);
    aliceWallet.setMRUBY_OUT_POINT_HASH(_MRUBY_OUT_POINT_HASH);
    Unlock aliceUnlock = aliceCredential.getUnlockScript('res/bitcoin_unlock.rb', reference: _MRUBY_CELL_HASH);
    String aliceAddress = aliceCredential.getAddress(aliceUnlock);
    int aliceBalance = await aliceWallet.getBalance(aliceAddress);
    print("alice`s address is ${aliceAddress} and balance is ${aliceBalance}");

    print("Miner send 1000 capacity to Bob...");
    String minerHash = await minerWallet.sendCapacity(minerUnlock, bobAddress, 1000);
    print(minerHash);
    Transaction transaction = await apiClient.getTransaction(minerHash);
    while (transaction == null) {
      print("The transaction are packaging into blockchain");
      transaction = await apiClient.getTransaction(minerHash);
      sleep(const Duration(seconds: 6));
    }
    bobBalance = await bobWallet.getBalance(bobAddress);
    print("Miner's transaction: ${jsonEncode(transaction)}");
    print("Bob's signed wallet address: " + bobAddress + " and balance: ${bobBalance}");

    print("Bob send 100 capacity to Alice...");
    String bobHash = await bobWallet.sendCapacity(bobUnlock, aliceAddress, 100);
    print(bobHash);
    Transaction bobTransaction = await apiClient.getTransaction(bobHash);
    while (bobTransaction == null) {
      print("The transaction are packaging into blockchain");
      bobTransaction = await apiClient.getTransaction(bobHash);
      sleep(const Duration(seconds: 6));
    }
    bobBalance = await bobWallet.getBalance(bobAddress);
    aliceBalance = await aliceWallet.getBalance(aliceAddress);
    print("Bob's transaction: ${jsonEncode(transaction)}");
    print("Bob's signed wallet address: " + bobAddress + " and balance: ${bobBalance}");
    print("Alice's signed wallet address: " + aliceAddress + " and balance: ${aliceBalance}");
  } catch (error) {
    if (error is RPCError) {
      print(jsonEncode(error));
    } else {
      print(error);
    }
  }
}
