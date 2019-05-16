import 'package:ckb_sdk/ckb-rpc/ckb_api_client.dart';
import 'package:ckb_sdk/ckb-types/item/cell_out_point.dart';
import 'package:ckb_sdk/ckb-types/item/cell_output.dart';
import 'package:ckb_sdk/ckb-types/item/transaction.dart';
import 'package:ckb_sdk/ckb-utils/crypto/hash.dart';
import 'package:ckb_sdk/ckb-utils/network.dart';
import 'package:ckb_sdk/ckb_system_contract/system_contract.dart';

Future<SystemContract> getSystemContract(CKBApiClient _ckbApiClient, Network network) async {
  if (network == Network.TestNet) {
    Transaction sysContract = (await _ckbApiClient.genesisBlock()).transactions[0];
    CellOutput cellOutput = sysContract.outputs[1];
    return SystemContract(blake2bHexString(cellOutput.data), CellOutPoint(sysContract.hash, "1"));
  } else {
    return null;
  }
}
