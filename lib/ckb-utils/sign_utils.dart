import 'dart:typed_data';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'number.dart' as number;
import 'crypto.dart' as crypto;
import 'package:ckb_sdk/ckb-types/res_export.dart';
import 'package:ckb_sdk/ckb-utils/blake2b.dart';

List<CellInput> signSigHashAllInputs(List<CellInput> cellInputs,
    List<CellOutput> cellOutputs, BigInt privateKey) {
  final Blake2b blake2b = new Blake2b(digestSize: 32);
  blake2b.update(utf8.encode("1"));
  for (final input in cellInputs) {
    blake2b.update(hex.decode(number.remove0x(input.previousOutput.hash)));
    blake2b.update(utf8.encode(input.previousOutput.index.toString()));
    blake2b.update(hex.decode(number.remove0x(input.unlock.getTypeHash())));
  }
  for (final output in cellOutputs) {
    blake2b.update(utf8.encode(output.capacity.toString()));
    blake2b.update(hex.decode(number.remove0x(output.lock)));
    if (output.type != null) {
      blake2b.update(hex.decode(number.remove0x(output.type.getTypeHash())));
    }
  }
  var hash_bytes = blake2b.doFinal();
  for (final input in cellInputs) {
    List<String> args = [];
    args.add(_signMessageForHexString(hash_bytes, privateKey));
    args.add("1");
    input.unlock.args = args;
  }
  return cellInputs;
}

String _signMessageForHexString(Uint8List message, BigInt privateKey) {
  Uint8List signature =
      crypto.sign(message, number.intToBytes(privateKey)).getDerSignature();
  return number.bytesToHex(signature);
}
