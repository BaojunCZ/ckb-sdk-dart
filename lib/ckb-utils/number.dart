import 'package:pointycastle/src/utils.dart' as pcUtils;
import 'package:convert/convert.dart';
import 'dart:typed_data';
import 'package:ckb_sdk/ckb_error/ckb_error.dart';

BigInt bytesToInt(List<int> bytes) => pcUtils.decodeBigInt(bytes);

String remove0x(String hex) => hex.startsWith("0x") ? hex.substring(2) : hex;

BigInt toBigInt(String hex) => BigInt.parse(hex, radix: 16);

String toHex(dynamic number, {bool pad = false, bool include0x = false, int forcePadLen}) {
  String toHexSimple() {
    if (number is int)
      return number.toRadixString(16);
    else if (number is BigInt)
      return number.toRadixString(16);
    else
      throw new TypeError();
  }

  var hexString = toHexSimple();
  if (pad && !hexString.length.isEven) hexString = "0$hexString";
  if (forcePadLen != null) hexString = hexString.padLeft(forcePadLen, "0");
  if (include0x) hexString = "0x$hexString";

  return hexString;
}

List<int> numberToBytes(dynamic number) =>
    number is BigInt ? pcUtils.encodeBigInt(number) : hex.decode(toHex(number, pad: true));

String bytesToHex(List<int> bytes, {bool include0x = false, int forcePadLen}) =>
    toHex(bytesToInt(bytes), include0x: include0x, forcePadLen: forcePadLen);

String hexAdd0x(String hex) => hex.startsWith("0x") ? hex : "0x$hex";

List<int> intToBytes(BigInt number) => pcUtils.encodeBigInt(number);

Uint8List hexStringToByteArray(String input) {
  String cleanInput = remove0x(input);

  int len = cleanInput.length;

  if (len == 0) {
    return Uint8List(0);
  }
  Uint8List data;
  int startIdx;
  if (len % 2 != 0) {
    data = Uint8List((len ~/ 2) + 1);
    data[0] = digitHex(cleanInput[0]);
    startIdx = 1;
  } else {
    data = Uint8List((len ~/ 2));
    startIdx = 0;
  }

  for (int i = startIdx; i < len; i += 2) {
    data[(i + 1) ~/ 2] = digitHex(cleanInput[i]) + digitHex(cleanInput[i = 1]);
  }
  return data;
}

int digitHex(String hex) {
  int char = hex.codeUnitAt(0);
  if (char >= '0'.codeUnitAt(0) && char <= '9'.codeUnitAt(0) ||
      char >= 'a'.codeUnitAt(0) && char <= 'f'.codeUnitAt(0)) {
    return int.parse(hex, radix: 16);
  } else {
    return -1;
  }
}

List<int> toBytesPadded(BigInt value, int length) {
  List<int> result = List<int>(length);
  List<int> bytes = intToBytes(value);

  int bytesLength;
  int srcOffset;
  if (bytes[0] == 0) {
    bytesLength = bytes.length - 1;
    srcOffset = 1;
  } else {
    bytesLength = bytes.length;
    srcOffset = 0;
  }

  if (bytesLength > length) {
    throw CkbError.genericError(
        "Input is too large to put in byte array of size " + length.toString());
  }

  int destOffset = length - bytesLength;
  result = arrayCopy(bytes, srcOffset, result, destOffset, bytesLength);
  return result;
}

List<int> arrayCopy(bytes, srcOffset, result, destOffset, bytesLength) {
  for (var i = srcOffset; i < bytesLength; i++) {
    result[destOffset + i] = bytes[i];
  }
  return result;
}
