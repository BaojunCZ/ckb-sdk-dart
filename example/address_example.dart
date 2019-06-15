import 'package:ckb_sdk/ckb_address.dart';

main() {
  final ckbAddressTestNet = CKBAddress(CKBNetwork.Testnet);
  final addressTestNet = ckbAddressTestNet
      .generate("0x024a501efd328e062c8675f2365970728c859c592beeefd6be8ead3d901330bc01");
  print(addressTestNet);
  final ckbAddressMainNet = CKBAddress(CKBNetwork.Mainnet);
  final addressMainNet = ckbAddressMainNet
      .generate("0x024a501efd328e062c8675f2365970728c859c592beeefd6be8ead3d901330bc01");
  print(addressMainNet);
}
