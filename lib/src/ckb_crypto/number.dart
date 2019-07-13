part of 'package:ckb_sdk/ckb_crypto.dart';

BigInt bytesToInt(List<int> bytes) => pc_utils.decodeBigInt(bytes);

String remove0x(String hex) => hex.startsWith("0x") ? hex.substring(2) : hex;

String hexAdd0x(String hex) => hex.startsWith("0x") ? hex : "0x$hex";

String numberToHex(dynamic number, {bool pad = false, bool include0x = false, int forcePadLen}) {
  String toHexSimple() {
    if (number is int) {
      return number.toRadixString(16);
    } else if (number is BigInt) {
      return number.toRadixString(16);
    } else {
      throw TypeError();
    }
  }

  var hexString = toHexSimple();
  if (pad && !hexString.length.isEven) hexString = "0$hexString";
  if (forcePadLen != null) hexString = hexString.padLeft(forcePadLen, "0");
  if (include0x) hexString = "0x$hexString";

  return hexString;
}

List<int> numberToBytes(dynamic number) =>
    number is BigInt ? pc_utils.encodeBigInt(number) : hex.decode(numberToHex(number, pad: true));

String bytesToHex(List<int> bytes, {bool pad = false, bool include0x = false, int forcePadLen}) =>
    numberToHex(bytesToInt(bytes), pad: pad, include0x: include0x, forcePadLen: forcePadLen);

List<int> intToBytes(BigInt number) => pc_utils.encodeBigInt(number);

String littleEndian(int number) {
  List<int> bytes = toBytesPadded(BigInt.from(number), 8);
  for (int i = 0; i < bytes.length / 2; i++) {
    int temp = bytes[i];
    bytes[i] = bytes[bytes.length - 1 - i];
    bytes[bytes.length - 1 - i] = temp;
  }
  return bytesToHex(bytes, include0x: true);
}

List<int> toBytesPadded(BigInt value, int length) {
  List<int> result = [];
  for (int i = 0; i < length; i++) {
    result.add(0);
  }
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
    throw CommonException("Input is too large to put in byte array of size " + length.toString());
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

Uint8List uint8ListFromList(List<int> data) {
  if (data is Uint8List) return data;

  return Uint8List.fromList(data);
}

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
    data[(i + 1) ~/ 2] = (digitHex(cleanInput[i]) << 4) + digitHex(cleanInput[i + 1]);
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
