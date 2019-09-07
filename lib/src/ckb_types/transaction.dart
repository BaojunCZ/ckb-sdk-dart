part of 'package:ckb_sdk/ckb_types.dart';

class Transaction {
  String version;
  String hash;
  List<CellDep> cellDeps;
  List<String> headerDeps;
  List<CellInput> inputs;
  List<CellOutput> outputs;
  List<String> outputsData;
  List<Witness> witnesses;

  Transaction(this.version, this.hash, this.cellDeps, this.headerDeps,
      this.inputs, this.outputs, this.outputsData, this.witnesses);

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
      json['version'] as String,
      json['hash'] as String,
      (json['cell_deps'] as List)
          ?.map((e) =>
              e == null ? null : CellDep.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['header_deps'] as List)?.map((e) => e as String)?.toList(),
      (json['inputs'] as List)
          ?.map((e) =>
              e == null ? null : CellInput.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['outputs'] as List)
          ?.map((e) =>
              e == null ? null : CellOutput.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['outputs_data'] as List)?.map((e) => e as String)?.toList(),
      (json['witnesses'] as List)
          ?.map((e) =>
              e == null ? null : Witness.fromJson(e as Map<String, dynamic>))
          ?.toList());

  Map<String, dynamic> toJson() => <String, dynamic>{
        'version': version,
        'hash': hash,
        'cell_deps': cellDeps,
        'header_deps': headerDeps,
        'inputs': inputs,
        'outputs': outputs,
        'outputs_data': outputsData,
        'witnesses': witnesses,
      };

  signTx(List<Uint8List> privateKeys, String txHash) {
    if (privateKeys.length != witnesses.length) {
      throw InvalidNumberOfWitnessesException();
    }
    for (int i = 0; i < witnesses.length; i++) {
      final oldData = witnesses[i].data;
      Blake2b blake2b = Blake2b();
      blake2b.update(hex.decode(remove0x(txHash)));
      oldData.forEach((data) {
        blake2b.update(hexStringToByteArray(data));
      });
      Uint8List signatureBytes =
          sign(blake2b.doFinal(), privateKeys[i]).getSignature();
      String signature = bytesToHex(signatureBytes, include0x: true);
      witnesses[i].data = [signature, ...oldData];
    }
  }
}
