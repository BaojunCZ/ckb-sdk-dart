import 'package:ckb_dart_sdk/ckb-types/res_export.dart';
import 'package:ckb_dart_sdk/ckb_error/ckb_error.dart';

ValidInputs gatherInputs(
    List<Cell> unSpentCells, int capacity, int minCapacity, Unlock unlock) {
  if (capacity < minCapacity) {
    throw CkbError.genericError(
        "capacity cannot be less than " + minCapacity.toString());
  }
  int inputCapacities = 0;
  List<CellInput> result = [];
  for (final cell in unSpentCells) {
    var input = CellInput(
        PreviousOutput(cell.outPoint.hash, cell.outPoint.index), unlock);
    result.add(input);
    inputCapacities += cell.capacity;
    if (inputCapacities >= capacity &&
        (inputCapacities - capacity) >= minCapacity) {
      break;
    }
  }
  if (inputCapacities < capacity) {
    throw CkbError.genericError("Not enough capacity!");
  }
  return ValidInputs(result, inputCapacities);
}

class ValidInputs {
  List<CellInput> inputs;
  int capacity;

  ValidInputs(this.inputs, this.capacity);
}
