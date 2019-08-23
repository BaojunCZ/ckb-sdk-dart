part of 'package:ckb_sdk/ckb_system_contract.dart';

Future<SystemContract> getSystemContract(
    CKBApiClient _ckbApiClient, CKBNetwork network) async {
  if (network == CKBNetwork.Testnet) {
    Transaction sysContract =
        (await _ckbApiClient.genesisBlock()).transactions[0];
    return SystemContract(
        hexAdd0x(blake2bHexString(sysContract.outputsData[1])),
        OutPoint(sysContract.hash, "1"));
  } else {
    return null;
  }
}
