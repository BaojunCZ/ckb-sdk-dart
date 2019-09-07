part of 'package:ckb_sdk/ckb_system_contract.dart';

class SystemContract {
  final String codeHash;
  final OutPoint systemScriptOutPoint;

  SystemContract(this.codeHash, this.systemScriptOutPoint);
}
