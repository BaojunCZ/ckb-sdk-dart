/*
 * @Author: BaojunCZ
 * @Date: 2019-01-10 21:18:58
 * @LastEditors: your name
 * @LastEditTime: 2019-03-01 14:33:42
 * @Description: file content
 */
import 'dart:typed_data';

import 'package:ckb_sdk/ckb-types/item/cell_input.dart';
import 'package:ckb_sdk/ckb-types/item/cell_output.dart';
import "package:ckb_sdk/ckb-types/item/out_point.dart";
import 'package:ckb_sdk/ckb-types/item/witness.dart';
import 'package:ckb_sdk/ckb-utils/crypto/crypto.dart';
import 'package:ckb_sdk/ckb-utils/crypto/sign.dart';
import 'package:ckb_sdk/ckb-utils/number.dart';
import 'package:ckb_sdk/ckb_error/ckb_error.dart';
import 'package:convert/convert.dart';

class Transaction {
  String version;
  String hash;
  List<OutPoint> deps;
  List<CellInput> inputs;
  List<CellOutput> outputs;
  List<Witness> witnesses;

  Transaction(this.version, this.hash, this.deps, this.inputs, this.outputs, this.witnesses);

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
      json['version'] as String,
      json['hash'] as String,
      (json['deps'] as List)
          ?.map((e) => e == null ? null : OutPoint.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['inputs'] as List)
          ?.map((e) => e == null ? null : CellInput.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['outputs'] as List)
          ?.map((e) => e == null ? null : CellOutput.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['witnesses'] as List)
          ?.map((e) => e == null ? null : Witness.fromJson(e as Map<String, dynamic>))
          ?.toList());

  Map<String, dynamic> toJson() => <String, dynamic>{
        'version': version,
        'hash': hash,
        'deps': deps,
        'inputs': inputs,
        'outputs': outputs,
        'witnesses': witnesses,
      };

  signTx(List<Uint8List> privateKeys, String txHash) {
    if (privateKeys.length != witnesses.length) {
      throw InvalidNumberOfWitnessesException();
    }
    for (int i = 0; i < witnesses.length; i++) {
      final oldData = witnesses[i].data;
      var txHashBytes = hex.decode(remove0x(txHash));
      Uint8List signatureBytes = sign(txHashBytes, privateKeys[i]).getDerSignature();
      String signature = bytesToHex(signatureBytes, include0x: true);
      String publicKey =
          bytesToHex(publicKeyFromPrivate(privateKeys[i]), include0x: true, forcePadLen: 66);
      witnesses[i].data = [publicKey, signature, ...oldData];
    }
  }
}
