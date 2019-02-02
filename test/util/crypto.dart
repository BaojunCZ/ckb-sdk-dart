import 'dart:convert';
import '../../lib/ckb-utils/sha3.dart';
import 'package:test/test.dart';
import 'package:convert/convert.dart';

void main() {
  test("sh3", () {
    const int _shaBytes = 256 ~/ 8;
    final SHA3Digest sha3digest = new SHA3Digest(_shaBytes * 8);
    var result = sha3digest.process(utf8.encode("hello ckb"));
    expect("f3ac0212947c7de8cea1a48c8b5534e771d1644ab77b8dede1d8e7af0f83791c",
        hex.encode(result));
  });
}
