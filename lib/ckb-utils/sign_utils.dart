import '../ckb-types/res_export.dart';
import 'sha3.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'number.dart' as number;
import 'crypto.dart' as crypto;

List<CellInput> signSigHashAllInputs(List<CellInput> cellInputs, List<CellOutput> cellOutputs, BigInt privateKey) {
  SHA3Digest sha3 = SHA3Digest(256);
  _update(sha3, utf8.encode("1"));
  for (final input in cellInputs) {
    _update(sha3, hex.decode(number.remove0x(input.previousOutput.hash)));
    _update(sha3, utf8.encode(input.previousOutput.index.toString()));
    _update(sha3, hex.decode(number.remove0x(input.unlock.getTypeHash())));
  }
  for (final output in cellOutputs) {
    _update(sha3, utf8.encode(output.capacity.toString()));
    _update(sha3, hex.decode(number.remove0x(output.lock)));
    if (output.type != null) {
      _update(sha3, hex.decode(number.remove0x(output.type.getTypeHash())));
    }
  }
  var out = new Uint8List(sha3.digestSize);
  var len = sha3.doFinal(out, 0);
  var hash_bytes = out.sublist(0, len);
  for (final input in cellInputs) {
    List<String> args = [];
    args.add(_signMessageForHexString(hash_bytes, privateKey));
    args.add("1");
    input.unlock.args = args;
  }
  return cellInputs;
}

 _update(SHA3Digest sha3, Uint8List input) {
  return sha3.update(input, 0, input.length);
}

String _signMessageForHexString(Uint8List message, BigInt privateKey) {
  Uint8List signature = crypto.sign(message, number.intToBytes(privateKey)).getDerSignature();
  return number.bytesToHex(signature);
}
