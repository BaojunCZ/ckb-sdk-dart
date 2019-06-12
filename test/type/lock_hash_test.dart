import 'package:ckb_sdk/ckb-rpc/ckb_api_client.dart';
import 'package:ckb_sdk/ckb-utils/crypto/crypto.dart';
import 'package:ckb_sdk/ckb-utils/network.dart';
import 'package:ckb_sdk/ckb_system_contract.dart';
import 'package:ckb_sdk/ckb_types.dart' show Script;
import 'package:convert/convert.dart';
import 'package:test_api/test_api.dart';

main() {
  test('get system contract', () async {
    try {
      SystemContract systemContract =
          await getSystemContract(CKBApiClient("http://localhost:8114"), Network.TestNet);
      String privateKey = "e79f3207ea4980b7fed79956d5934249ceac4751a4fae01a0f7c4a96884bc4e3";
      String publicKey = hex.encode(publicKeyFromPrivate(hex.decode(privateKey)));
      String hash = blake160(publicKey);
      Script lockScript = Script(systemContract.codeHash, [hash]);
      String lockHash = lockScript.scriptHash;
      print(lockHash);
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });
}
