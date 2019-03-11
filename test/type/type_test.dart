import 'package:test/test.dart';
import 'package:ckb_dart_sdk/ckb-types/item/unlock.dart';

main() {
  test('test empty type script', () {
    Unlock unlock = Unlock(0, null, [], [], null);
    expect(unlock.getTypeHash(),
        '0x4b29eb5168ba6f74bff824b15146246109c732626abd3c0578cbf147d8e28479');
  });

  test('test type script', () {
    Unlock unlock = Unlock(
        0,
        "0x0000000000000000000000000000000000000000000000000000000000000000",
        ["0x01"],
        ["0x01"],
        "0x01");
    String hash = unlock.getTypeHash();
    expect(hash,
        '0xafb140d0673571ed5710d220d6146d41bd8bc18a3a4ff723dad4331da5af5bb6');
  });

}
