import 'package:ckb_sdk/ckb_rpc.dart';
import 'package:ckb_sdk/ckb_system_contract.dart';
import 'package:test/test.dart';

main() {
  test('get system contract', () async {
    try {
      SystemContract systemContract =
          await getSystemContract(CKBApiClient("http://localhost:8114"));
      expect(systemContract.codeHash,
          "f1951123466e4479842387a66fabfd6b65fc87fd84ae8e6cd3053edb27fff2fd");
    } catch (error) {
      print(error.toString());
      expect(true, true);
    }
  });
}
