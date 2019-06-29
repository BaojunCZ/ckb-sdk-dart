part of 'package:ckb_sdk/ckb_system_contract.dart';

Future<SystemContract> getSystemContract(CKBApiClient _ckbApiClient, CKBNetwork network) async {
  if (network == CKBNetwork.Testnet) {
    Transaction sysContract = (await _ckbApiClient.genesisBlock()).transactions[0];
    CellOutput cellOutput = sysContract.outputs[1];
    return SystemContract(
        hexAdd0x(blake2bHexString(cellOutput.data)), CellOutPoint(sysContract.hash, "1"));
  } else {
    return null;
  }
}
