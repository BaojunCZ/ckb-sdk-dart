import 'package:pointycastle/src/utils.dart' as pcUtils;
import 'package:convert/convert.dart';
import 'package:ckb_sdk/ckb_error/ckb_error.dart';

BigInt bytesToInt(List<int> bytes) => pcUtils.decodeBigInt(bytes);

String remove0x(String hex) => hex.startsWith("0x") ? hex.substring(2) : hex;

BigInt toBigInt(String hex) => BigInt.parse(hex, radix: 16);

String toHex(dynamic number,
    {bool pad = false, bool include0x = false, int forcePadLen}) {
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

List<int> numberToBytes(dynamic number) => number is BigInt
    ? pcUtils.encodeBigInt(number)
    : hex.decode(toHex(number, pad: true));

String bytesToHex(List<int> bytes, {bool include0x = false, int forcePadLen}) =>
    toHex(bytesToInt(bytes), include0x: include0x, forcePadLen: forcePadLen);

String hexAdd0x(String hex) => hex.startsWith("0x") ? hex : "0x$hex";

List<int> intToBytes(BigInt number) => pcUtils.encodeBigInt(number);

List<int> hexStringToByteArray(String input) {
  String cleanInput = remove0x(input);

  int len = cleanInput.length;

  if (len == 0) {
    return [];
  }
  List<int> data;
  int startIdx;
  if (len % 2 != 0) {
    data = List<int>((len ~/ 2) + 1);
    data[0] = digit(cleanInput.codeUnitAt(0), 16);
    startIdx = 1;
  } else {
    data = List<int>((len ~/ 2));
    startIdx = 0;
  }

  for (int i = startIdx; i < len; i += 2) {
    data[(i + 1) ~/ 2] = ((digit(cleanInput.codeUnitAt(i), 16) << 4) +
        digit(cleanInput.codeUnitAt(i + 1), 16));
  }
  return data;
}

int digit(int ch, int radix) {
  int value = -1;
  if (radix >= 2 && radix <= 36) {
    int val = getProperties(ch);
    int kind = val & 0x1F;
    if (kind == 9) {
      value = ch + ((val & 0x3E0) >> 5) & 0x1F;
    } else if ((val & 0xC00) == 0x00000C00) {
      value = (ch + ((val & 0x3E0) >> 5) & 0x1F) + 10;
    }
  }
  return (value < radix) ? value : -1;
}

int getProperties(int ch) {
  List<int> A = List<int>(256);
  String A_DATA = "\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800" +
      "\u100F\u4800\u100F\u4800\u100F\u5800\u400F\u5000\u400F\u5800\u400F\u6000\u400F" +
      "\u5000\u400F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800" +
      "\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F" +
      "\u4800\u100F\u4800\u100F\u5000\u400F\u5000\u400F\u5000\u400F\u5800\u400F\u6000" +
      "\u400C\u6800\030\u6800\030\u2800\030\u2800\u601A\u2800\030\u6800\030\u6800" +
      "\030\uE800\025\uE800\026\u6800\030\u2000\031\u3800\030\u2000\024\u3800\030" +
      "\u3800\030\u1800\u3609\u1800\u3609\u1800\u3609\u1800\u3609\u1800\u3609\u1800" +
      "\u3609\u1800\u3609\u1800\u3609\u1800\u3609\u1800\u3609\u3800\030\u6800\030" +
      "\uE800\031\u6800\031\uE800\031\u6800\030\u6800\030\202\u7FE1\202\u7FE1\202" +
      "\u7FE1\202\u7FE1\202\u7FE1\202\u7FE1\202\u7FE1\202\u7FE1\202\u7FE1\202\u7FE1" +
      "\202\u7FE1\202\u7FE1\202\u7FE1\202\u7FE1\202\u7FE1\202\u7FE1\202\u7FE1\202" +
      "\u7FE1\202\u7FE1\202\u7FE1\202\u7FE1\202\u7FE1\202\u7FE1\202\u7FE1\202\u7FE1" +
      "\202\u7FE1\uE800\025\u6800\030\uE800\026\u6800\033\u6800\u5017\u6800\033\201" +
      "\u7FE2\201\u7FE2\201\u7FE2\201\u7FE2\201\u7FE2\201\u7FE2\201\u7FE2\201\u7FE2" +
      "\201\u7FE2\201\u7FE2\201\u7FE2\201\u7FE2\201\u7FE2\201\u7FE2\201\u7FE2\201" +
      "\u7FE2\201\u7FE2\201\u7FE2\201\u7FE2\201\u7FE2\201\u7FE2\201\u7FE2\201\u7FE2" +
      "\201\u7FE2\201\u7FE2\201\u7FE2\uE800\025\u6800\031\uE800\026\u6800\031\u4800" +
      "\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u5000\u100F" +
      "\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800" +
      "\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F" +
      "\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800" +
      "\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F\u4800\u100F" +
      "\u3800\014\u6800\030\u2800\u601A\u2800\u601A\u2800\u601A\u2800\u601A\u6800" +
      "\034\u6800\030\u6800\033\u6800\034\000\u7005\uE800\035\u6800\031\u4800\u1010" +
      "\u6800\034\u6800\033\u2800\034\u2800\031\u1800\u060B\u1800\u060B\u6800\033" +
      "\u07FD\u7002\u6800\030\u6800\030\u6800\033\u1800\u050B\000\u7005\uE800\036" +
      "\u6800\u080B\u6800\u080B\u6800\u080B\u6800\030\202\u7001\202\u7001\202\u7001" +
      "\202\u7001\202\u7001\202\u7001\202\u7001\202\u7001\202\u7001\202\u7001\202" +
      "\u7001\202\u7001\202\u7001\202\u7001\202\u7001\202\u7001\202\u7001\202\u7001" +
      "\202\u7001\202\u7001\202\u7001\202\u7001\202\u7001\u6800\031\202\u7001\202" +
      "\u7001\202\u7001\202\u7001\202\u7001\202\u7001\202\u7001\u07FD\u7002\201\u7002" +
      "\201\u7002\201\u7002\201\u7002\201\u7002\201\u7002\201\u7002\201\u7002\201" +
      "\u7002\201\u7002\201\u7002\201\u7002\201\u7002\201\u7002\201\u7002\201\u7002" +
      "\201\u7002\201\u7002\201\u7002\201\u7002\201\u7002\201\u7002\201\u7002\u6800" +
      "\031\201\u7002\201\u7002\201\u7002\201\u7002\201\u7002\201\u7002\201\u7002" +
      "\u061D\u7002";
  List<int> result = List<int>(A_DATA.length);
  for (var i = 0; i < A_DATA.length; i++) {
    result[0 + i] = A_DATA.codeUnitAt(i);
  }
  int i = 0, j = 0;
  while (i < (256 * 2)) {
    int entry = result[i++] << 16;
    A[j++] = entry | result[i++];
  }
  int props = A[ch];
  return props;
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
