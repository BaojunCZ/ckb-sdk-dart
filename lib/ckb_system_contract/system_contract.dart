import 'package:ckb_sdk/ckb-types/item/cell_out_point.dart';

class SystemContract {
  final String codeHash;
  final CellOutPoint systemScriptOutPoint;

  SystemContract(this.codeHash, this.systemScriptOutPoint);
}
