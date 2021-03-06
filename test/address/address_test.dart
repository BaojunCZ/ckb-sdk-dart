import 'package:bip_bech32/bip_bech32.dart';
import 'package:ckb_sdk/ckb_address.dart';
import 'package:ckb_sdk/ckb_crypto.dart';
import 'package:convert/convert.dart';
import 'package:test/test.dart';

main() {
  test('privateKey to blake160', () {
    String privateKey = "e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3";
    String publicKey = hex.encode(publicKeyFromPrivate(hex.decode(privateKey)));
    print(publicKey);
    String hash = blake160(publicKey);
    print(hash);
  });

  test('publicKey to blake160', () {
    String hash = blake160("0x024a501efd328e062c8675f2365970728c859c592beeefd6be8ead3d901330bc01");
    expect("36c329ed630d6ce750712a477543672adab57f4c", hash);
  });

  test('publicKey hash to address TestNet', () {
    var ckbAddress = CKBAddress(CKBNetwork.Testnet);
    var address = ckbAddress.generateFromPublicKey(
        "0x024a501efd328e062c8675f2365970728c859c592beeefd6be8ead3d901330bc01");
    expect("ckt1qyqrdsefa43s6m882pcj53m4gdnj4k440axqswmu83", address);
  });

  test('publicKey hash to address MainNet', () {
    var ckbAddress = CKBAddress(CKBNetwork.Mainnet);
    var address = ckbAddress.generateFromPublicKey(
        "0x024a501efd328e062c8675f2365970728c859c592beeefd6be8ead3d901330bc01");
    expect("ckb1qyqrdsefa43s6m882pcj53m4gdnj4k440axqdt9rtd", address);
  });

  test('privateKey to address TestNet', () {
    var ckbAddress = CKBAddress(CKBNetwork.Testnet);
    var address = ckbAddress.generateFromPublicKey(bytesToHex(publicKeyFromPrivate(
        hex.decode("e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3"))));
    expect(address, "ckt1qyqrdsefa43s6m882pcj53m4gdnj4k440axqswmu83");
  });

  test('address parse', () {
    var ckbAddress = CKBAddress(CKBNetwork.Testnet);
    String address = "ckt1q9gry5zgxmpjnmtrp4kww5r39frh2sm89tdt2l6v234ygf";
    String payload = "0x015032504836c329ed630d6ce750712a477543672adab57f4c";
    Bech32 bech32 = ckbAddress.parse(address);
    String hash = bytesToHex(bech32.data, include0x: true, pad: true);
    expect(hash, payload);
  });

  test('blake160 from address', () {
    var ckbAddress = CKBAddress(CKBNetwork.Testnet);
    String address = "ckt1qyqrdsefa43s6m882pcj53m4gdnj4k440axqswmu83";
    String publicKey = ckbAddress.blake160FromAddress(address);
    expect(publicKey, "36c329ed630d6ce750712a477543672adab57f4c");
  });
}
