part of 'package:ckb_sdk/ckb_serialization.dart';

Struct serializeOutPoint(OutPoint outPoint) {
  Byte32 txHash = new Byte32(string: outPoint.txHash);
  Uint32 index = new Uint32(intValue: int.parse(outPoint.index, radix: 16));
  return new Struct([txHash, index]);
}

Table serializeScript(Script script) {
  return new Table([
    new Byte32(string: script.codeHash),
    new Byte1(string: Script.DATA == script.hashType ? "00" : "01"),
    new Bytes(string: script.args)
  ]);
}

Struct serializeCellInput(CellInput cellInput) {
  Uint64 sinceUInt64 =
      new Uint64(intValue: BigInt.parse(cellInput.since, radix: 16));
  Struct outPointStruct = serializeOutPoint(cellInput.previousOutput);
  return new Struct([sinceUInt64, outPointStruct]);
}

Table serializeCellOutput(CellOutput cellOutput) {
  return new Table([
    new Uint64(intValue: BigInt.parse(cellOutput.capacity, radix: 16)),
    serializeScript(cellOutput.lock),
    cellOutput.type != null ? serializeScript(cellOutput.type) : new Empty()
  ]);
}

Struct serializeCellDep(CellDep cellDep) {
  Struct outPointStruct = serializeOutPoint(cellDep.outPoint);
  Byte1 depTypeBytes = CellDep.CODE == cellDep.depType
      ? new Byte1(string: "0")
      : new Byte1(string: "1");
  return new Struct([outPointStruct, depTypeBytes]);
}

Fixed<Struct> serializeCellDeps(List<CellDep> cellDeps) {
  List<Struct> cellDepList = [];
  for (CellDep cellDep in cellDeps) {
    cellDepList.add(serializeCellDep(cellDep));
  }
  return new Fixed<Struct>(cellDepList);
}

Fixed<Struct> serializeCellInputs(List<CellInput> cellInputs) {
  List<Struct> cellInputList = [];
  for (CellInput cellInput in cellInputs) {
    cellInputList.add(serializeCellInput(cellInput));
  }
  return new Fixed<Struct>(cellInputList);
}

Dynamic<Table> serializeCellOutputs(List<CellOutput> cellOutputs) {
  List<Table> cellOutputList = [];
  for (CellOutput cellOutput in cellOutputs) {
    cellOutputList.add(serializeCellOutput(cellOutput));
  }
  return new Dynamic<Table>(cellOutputList);
}

Dynamic<Bytes> serializeBytes(List<String> bytes) {
  List<Bytes> bytesList = [];
  for (String data in bytes) {
    bytesList.add(new Bytes(string: data));
  }
  return new Dynamic<Bytes>(bytesList);
}

Fixed<Byte32> serializeByte32(List<String> bytes) {
  List<Byte32> byte32List = [];
  for (String data in bytes) {
    byte32List.add(new Byte32(string: data));
  }
  return new Fixed<Byte32>(byte32List);
}

Table serializeTransaction(Transaction transaction) {
  Transaction tx = parseTransaction(transaction);
  Uint32 versionUInt32 = new Uint32(string: tx.version);
  Fixed<Struct> cellDepFixed = serializeCellDeps(tx.cellDeps);
  Fixed<Byte32> headerDepFixed = serializeByte32(tx.headerDeps);
  Fixed<Struct> inputsFixed = serializeCellInputs(tx.inputs);
  Dynamic<Table> outputsVec = serializeCellOutputs(tx.outputs);
  Dynamic<Bytes> dataVec = serializeBytes(tx.outputsData);
  return new Table([
    versionUInt32,
    cellDepFixed,
    headerDepFixed,
    inputsFixed,
    outputsVec,
    dataVec
  ]);
}
