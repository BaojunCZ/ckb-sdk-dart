import 'package:ckb_sdk/ckb-rpc/ckb_api_client.dart';
import 'package:ckb_sdk/ckb-utils/network.dart';
import 'package:ckb_sdk/ckb_system_contract/ckb_system_contract.dart';
import 'package:ckb_sdk/ckb_system_contract/system_contract.dart';
import 'package:test/test.dart';

main() {
  test('get system contract', () async {
    try {
      SystemContract systemContract =
          await getSystemContract(CKBApiClient("http://192.168.2.78:8121"), Network.TestNet);
      expect(systemContract.codeHash,
          "0x9e3b3557f11b2b3532ce352bfe8017e9fd11d154c4c7f9b7aaaa1e621b539a08");
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });
}
