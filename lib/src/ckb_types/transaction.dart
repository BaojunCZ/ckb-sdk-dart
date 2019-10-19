part of 'package:ckb_sdk/ckb_types.dart';

class Transaction {
  String version;
  String hash;
  List<CellDep> cellDeps;
  List<String> headerDeps;
  List<CellInput> inputs;
  List<CellOutput> outputs;
  List<String> outputsData;
  List<String> witnesses;

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
      (json['witnesses'] as List)?.map((e) => e as String)?.toList());

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

  String computeHash() {
    Blake2b blake2b = new Blake2b();
    blake2b.update(serializeRawTransaction(this).toBytes());
    return bytesToHex(blake2b.doFinal());
  }

  signTx(List<Uint8List> privateKeys) {
    if (privateKeys.length != witnesses.length) {
      throw InvalidNumberOfWitnessesException();
    }
    String txHash = computeHash();
    List<String> signedWitness = [];
    for (int i = 0; i < witnesses.length; i++) {
      Blake2b blake2b = Blake2b();
      blake2b.update(hex.decode(remove0x(txHash)));
      blake2b.update(hex.decode(remove0x(witnesses[i])));
      Uint8List signatureBytes =
          sign(blake2b.doFinal(), privateKeys[i]).getSignature();
      String signature = bytesToHex(signatureBytes, include0x: true);
      signedWitness.add(signature);
    }
    witnesses = signedWitness;
  }
}
