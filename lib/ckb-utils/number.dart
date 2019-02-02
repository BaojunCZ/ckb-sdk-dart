import 'package:pointycastle/src/utils.dart' as pcUtils;
import 'package:convert/convert.dart';

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

String bytesToHex(List<int> bytes, {bool include0x = false}) =>
    toHex(bytesToInt(bytes), include0x: include0x);

String hexAdd0x(String hex) => hex.startsWith("0x") ? hex : "0x$hex";
