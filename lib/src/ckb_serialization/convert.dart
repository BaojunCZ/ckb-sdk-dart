part of 'package:ckb_sdk/ckb_serialization.dart';

OutPoint parseOutPoint(OutPoint outPoint) {
  return new OutPoint(outPoint.txHash, toHex(outPoint.index));
}

Transaction parseTransaction(Transaction transaction) {
  List<CellDep> cellDeps = [];
  for (CellDep cellDep in transaction.cellDeps) {
    cellDeps.add(new CellDep(
        new OutPoint(cellDep.outPoint.txHash, toHex(cellDep.outPoint.index)),
        cellDep.depType));
  }

  List<CellInput> inputs = [];
  for (CellInput cellInput in transaction.inputs) {
    inputs.add(new CellInput(
        new OutPoint(cellInput.previousOutput.txHash,
            toHex(cellInput.previousOutput.index)),
        toHex(cellInput.since)));
  }

  List<CellOutput> outputs = [];
  for (CellOutput cellOutput in transaction.outputs) {
    outputs.add(new CellOutput(
        toHex(cellOutput.capacity), cellOutput.lock, cellOutput.type));
  }

  return new Transaction(
      toHex(transaction.version),
      "",
      cellDeps,
      transaction.headerDeps,
      inputs,
      outputs,
      transaction.outputsData,
      transaction.witnesses);
}
