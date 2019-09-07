part of 'package:ckb_sdk/ckb_system_contract.dart';

Future<SystemContract> getSystemContract(CKBApiClient _ckbApiClient) async {
  Block block = await _ckbApiClient.genesisBlock();
  if (block.transactions == null || block.transactions.length < 2)
    throw NoSystemContactException();
  return SystemContract(block.transactions[0].outputs[1].type.codeHash,
      OutPoint(block.transactions[1].hash, "0"));
}
