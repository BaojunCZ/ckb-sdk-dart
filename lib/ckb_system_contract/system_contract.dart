import '../ckb_types.dart' show CellOutPoint;

class SystemContract {
  final String codeHash;
  final CellOutPoint systemScriptOutPoint;

  SystemContract(this.codeHash, this.systemScriptOutPoint);
}
