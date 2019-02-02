/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-02-02 17:41:17
 * @Description: file content
 */
import 'package:json_annotation/json_annotation.dart';
import '../../ckb-utils/sha3.dart';
import '../../ckb-utils/number.dart' as number;
import 'dart:typed_data';
import 'dart:convert';
import 'package:convert/convert.dart';
part 'cell_input.g.dart';

@JsonSerializable()
class CellInput {
  @JsonKey(name: 'previous_output')
  PreviousOutput previousOutput;
  Unlock unlock;

  CellInput(this.previousOutput, this.unlock);

  factory CellInput.fromJson(Map<String, dynamic> json) =>
      _$CellInputFromJson(json);
  Map<String, dynamic> toJson() => _$CellInputToJson(this);
}

@JsonSerializable()
class PreviousOutput {
  String hash;
  int index;

  PreviousOutput(this.hash, this.index);

  factory PreviousOutput.fromJson(Map<String, dynamic> json) =>
      _$PreviousOutputFromJson(json);
  Map<String, dynamic> toJson() => _$PreviousOutputToJson(this);
}

@JsonSerializable()
class Unlock {
  List<int> args;
  String binary;
  dynamic reference;
  @JsonKey(name: 'signed_args')
  List<String> signedArgs;
  int version;

  Unlock(this.version, this.reference, this.signedArgs, this.args, this.binary);

  factory Unlock.fromJson(Map<String, dynamic> json) => _$UnlockFromJson(json);
  Map<String, dynamic> toJson() => _$UnlockToJson(this);

  String getTypeHash() {
    SHA3Digest sha3 = SHA3Digest(256);
    _update(sha3, hex.decode(number.remove0x(reference)));
    _update(sha3, utf8.encode("|"));
    if (binary != null) {
      _update(sha3, hex.decode(binary));
    }
    signedArgs.forEach((signedArg) {
      _update(sha3, utf8.encode(signedArg));
    });
    var out = new Uint8List(sha3.digestSize);
    var len = sha3.doFinal(out, 0);
    var hash_bytes = out.sublist(0, len);
    return number.bytesToHex(hash_bytes, include0x: true);
  }

  _update(SHA3Digest sha3, Uint8List input) {
    return sha3.update(input, 0, input.length);
  }
}
