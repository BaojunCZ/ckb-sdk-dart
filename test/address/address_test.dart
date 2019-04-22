import 'package:ckb_sdk/ckb-utils/crypto.dart';
import 'package:ckb_sdk/ckb-utils/network.dart';
import 'package:ckb_sdk/ckb_address/ckb_address.dart';
import 'package:test/test.dart';

main() {
  test('publicKey hash', () {
    String hash = blake160(
        "0x024a501efd328e062c8675f2365970728c859c592beeefd6be8ead3d901330bc01");
    print(hash);
    expect("36c329ed630d6ce750712a477543672adab57f4c", hash);
  });

  test('publicKey hash to address TestNet', () {
    var ckbAddress = CKBAddress(Network.TestNet);
    var address = ckbAddress.generate(
        "0x024a501efd328e062c8675f2365970728c859c592beeefd6be8ead3d901330bc01");
    expect("ckt1q9gry5zgxmpjnmtrp4kww5r39frh2sm89tdt2l6v234ygf", address);
  });

  test('publicKey hash to address MainNet', () {
    var ckbAddress = CKBAddress(Network.MainNet);
    var address = ckbAddress.generate(
        "0x024a501efd328e062c8675f2365970728c859c592beeefd6be8ead3d901330bc01");
    expect("ckb1q9gry5zgxmpjnmtrp4kww5r39frh2sm89tdt2l6vqdd7em", address);
  });
}
