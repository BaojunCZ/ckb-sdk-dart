import 'package:bip_bech32/bip_bech32.dart';
import 'package:ckb_sdk/ckb-utils/crypto/crypto.dart';
import 'package:ckb_sdk/ckb-utils/network.dart';
import 'package:ckb_sdk/ckb-utils/number.dart';
import 'package:ckb_sdk/ckb_address/ckb_address.dart';
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
    var ckbAddress = CKBAddress(Network.TestNet);
    var address =
        ckbAddress.generate("390e45945092cbd81192cadd8ef268a398b49f521173d4c135f88893232b5c1af");
    expect("ckt1q9gry5zgqnlmxcfvrjrm6m2ck2cmg9zev2rrpnnc3d940f", address);
  });

  test('publicKey hash to address MainNet', () {
    var ckbAddress = CKBAddress(Network.MainNet);
    var address =
        ckbAddress.generate("0x024a501efd328e062c8675f2365970728c859c592beeefd6be8ead3d901330bc01");
    expect("ckb1q9gry5zgxmpjnmtrp4kww5r39frh2sm89tdt2l6vqdd7em", address);
  });

  test('privateKey to address TestNet', () {
    var ckbAddress = CKBAddress(Network.TestNet);
    var address = ckbAddress.generate(bytesToHex(publicKeyFromPrivate(intToBytes(
        toBigInt(remove0x("e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3"))))));
    expect(address, "ckt1q9gry5zgxmpjnmtrp4kww5r39frh2sm89tdt2l6v234ygf");
  });

  test('address parse', () {
    var ckbAddress = CKBAddress(Network.TestNet);
    String address = "ckt1q9gry5zgxmpjnmtrp4kww5r39frh2sm89tdt2l6v234ygf";
    String payload = "0x015032504836c329ed630d6ce750712a477543672adab57f4c";
    Bech32 bech32 = ckbAddress.parse(address);
    String hash = bytesToHex(bech32.data, include0x: true, pad: true);
    expect(hash, payload);
  });

  test('public key from address', () {
    var ckbAddress = CKBAddress(Network.TestNet);
    String address = "ckt1q9gry5zgxmpjnmtrp4kww5r39frh2sm89tdt2l6v234ygf";
    String publicKey = ckbAddress.blake160FromAddress(address);
    expect(publicKey, "36c329ed630d6ce750712a477543672adab57f4c");
  });
}
