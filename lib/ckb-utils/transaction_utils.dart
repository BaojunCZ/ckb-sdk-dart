import 'package:ckb_dart_sdk/ckb-types/res_export.dart';
import 'dart:convert';
import 'package:ckb_dart_sdk/ckb-utils/number.dart' as number;

formatTx(Transaction transaction) {
  for (final input in transaction.inputs) {
    input.unlock.signedArgs = _formatList(input.unlock.signedArgs);
    input.unlock.args = _formatList(input.unlock.args);
    input.unlock.binary = _formatNonNullString(input.unlock.binary);
  }
  for (final output in transaction.outputs) {
    output.data = output.data.isEmpty ? "0x3078" : number.bytesToHex(utf8.encode(output.data), include0x: true);
    if (output.type != null) {
      output.type.signedArgs = _formatList(output.type.signedArgs);
      output.type.args = _formatList(output.type.args);
      output.type.binary = _formatNonNullString(output.type.binary);
    }
  }
  return transaction;
}

_formatNonNullString(String value) {
  return value != null && value.isNotEmpty ? number.bytesToHex(utf8.encode(value), include0x: true) : value;
}

_formatList(List<String> values) {
  List<String> results = [];
  for (final value in values) {
    results.add(number.bytesToHex(utf8.encode(value), include0x: true));
  }
  return results;
}
