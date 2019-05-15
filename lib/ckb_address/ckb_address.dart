import 'dart:typed_data';

import 'package:bip_bech32/bip_bech32.dart';
import 'package:ckb_sdk/ckb-utils/crypto/crypto.dart';
import 'package:ckb_sdk/ckb-utils/network.dart';
import 'package:ckb_sdk/ckb-utils/number.dart';
import 'package:ckb_sdk/ckb_address/address_config.dart';
import 'package:convert/convert.dart';

class CKBAddress {
  final Network network;

  CKBAddress(this.network);

  String generate(String publicKey) {
    // Payload: type(01) | bin-idx("P2PH") | pubkey blake160
    String payload = TYPE1 + _binIdx(BIN_IDX1) + blake160(publicKey);
    Uint8List data = hexStringToByteArray(payload);
    Bech32Codec bech32codec = Bech32Codec();
    return bech32codec.encode(Bech32(_prefix(), _convertBits(data, 8, 5, true)));
  }

  Bech32 parse(String address) {
    Bech32Codec bech32codec = Bech32Codec();
    Bech32 parsed = bech32codec.decode(address);
    Uint8List data = _convertBits(parsed.data, 5, 8, false);
    if (data.length == 0) {
      return null;
    }
    return Bech32(parsed.hrp, data);
  }

  String blake160FromAddress(String address) {
    Bech32 bech32 = parse(address);
    String payload = hex.encode(bech32.data);
    if (payload.startsWith(TYPE1)) {
      return payload.replaceAll(TYPE1 + _binIdx(BIN_IDX1), "");
    }
    return null;
  }

  Uint8List _convertBits(Uint8List data, int fromBits, int toBits, bool pad) {
    int length = pad ? data.length * fromBits ~/ toBits : (data.length * fromBits / toBits).ceil();
    int mask = ((1 << toBits) - 1) & 0xff;
    Uint8List result = Uint8List(length);
    int index = 0;
    int accumulator = 0;
    int bits = 0;
    for (int i = 0; i < data.length; i++) {
      int value = data[i];
      accumulator = (((accumulator & 0xff) << fromBits) | (value & 0xff));
      bits += fromBits;
      while (bits >= toBits) {
        bits -= toBits;
        result[index] = (accumulator >> bits) & mask;
        ++index;
      }
    }
    if (!pad) {
      if (bits > 0) {
        result[index] = (accumulator << (toBits - bits)) & mask;
      }
    } else {
      if (!(bits < fromBits && ((accumulator << (toBits - bits)) & mask) == 0)) {
        throw Exception("Strict mode was used but input couldn't be converted without padding");
      }
    }
    return result;
  }

  String _prefix() => network == Network.MainNet ? MainNetPrefix : TestNetPrefix;

  String _binIdx(String binIdx) {
    String result = "";
    binIdx.codeUnits.forEach((code) {
      result += toHex(code);
    });
    return result;
  }
}
