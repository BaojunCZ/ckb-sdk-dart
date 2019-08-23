part of 'package:ckb_sdk/ckb_system_contract.dart';

Future<SystemContract> getSystemContract(CKBApiClient _ckbApiClient) async {
  Transaction sysContract =
      (await _ckbApiClient.genesisBlock()).transactions[1];
  if (sysContract == null) throw NoSystemContactException();
  return SystemContract(
      hexAdd0x(blake2bHexString(sysContract.outputs[0].lock.scriptHash)),
      OutPoint(sysContract.hash, "0"));
}
