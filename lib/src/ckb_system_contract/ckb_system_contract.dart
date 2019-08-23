part of 'package:ckb_sdk/ckb_system_contract.dart';

Future<SystemContract> getSystemContract(CKBApiClient _ckbApiClient) async {
  Transaction transaction0 =
      (await _ckbApiClient.genesisBlock()).transactions[0];
  Transaction transaction1 =
      (await _ckbApiClient.genesisBlock()).transactions[1];
  if (transaction0 == null || transaction1 == null)
    throw NoSystemContactException();
  return SystemContract(hexAdd0x(blake2bHexString(transaction0.outputsData[1])),
      OutPoint(transaction1.hash, "0"));
}
