part of 'package:ckb_sdk/ckb_types.dart';

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
      Blake2b blake2b = Blake2b();
      blake2b.update(hex.decode(remove0x(txHash)));
      oldData.forEach((data) {
        blake2b.update(hexStringToByteArray(data));
      });
      Uint8List signatureBytes = sign(blake2b.doFinal(), privateKeys[i]).getSignature();
      String signature = bytesToHex(signatureBytes, include0x: true);
      witnesses[i].data = [signature, ...oldData];
    }
  }
}
