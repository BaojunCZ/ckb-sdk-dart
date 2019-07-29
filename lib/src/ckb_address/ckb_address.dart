part of 'package:ckb_sdk/ckb_address.dart';

class CKBAddress {
  final CKBNetwork network;

  CKBAddress(this.network);

  String generateFromPublicKey(String publicKey) {
    return generate(blake160(publicKey));
  }

  String generate(String args) {
    // Payload: type(01) | code hash index(00, P2PH) | pubkey blake160
    String payload = TYPE1 + CODE_HASH_IDX + remove0x(args);
    Uint8List data = hexStringToByteArray(payload);
    Bech32Codec bech32codec = Bech32Codec();
    return bech32codec.encode(Bech32(_prefix(), _convertBits(data, 8, 5, true)));
  }

  Bech32 parse(String address) {
    Bech32Codec bech32codec = Bech32Codec();
    Bech32 parsed = bech32codec.decode(address);
    Uint8List data = _convertBits(parsed.data, 5, 8, false);
    if (data.isEmpty) {
      return null;
    }
    return Bech32(parsed.hrp, data);
  }

  String blake160FromAddress(String address) {
    Bech32 bech32 = parse(address);
    String payload = hex.encode(bech32.data);
    if (payload.startsWith(TYPE1)) {
      return payload.replaceAll(TYPE1 + CODE_HASH_IDX, "");
    }
    return null;
  }

  Uint8List _convertBits(Uint8List data, int fromBits, int toBits, bool pad) {
    int acc = 0;
    int bits = 0;
    int maxv = (1 << toBits) - 1;
    List<int> ret = List<int>();
    for (int i = 0; i < data.length; i++) {
      int b = data[i] & 0xff;
      if ((b >> fromBits) > 0) {
        throw Exception("Address format exception");
      }
      acc = (acc << fromBits) | b;
      bits += fromBits;
      while (bits >= toBits) {
        bits -= toBits;
        ret.add((acc >> bits) & maxv);
      }
    }

    if (pad && (bits > 0)) {
      ret.add((acc << (toBits - bits)) & maxv);
    } else if (bits >= fromBits || ((acc << (toBits - bits)) & maxv) != 0) {
      throw Exception("Strict mode was used but input couldn't be converted without padding");
    }
    return Uint8List.fromList(ret);
  }

  String _prefix() => network == CKBNetwork.Mainnet ? MainNetPrefix : TestNetPrefix;

  String _binIdx(String binIdx) {
    String result = "";
    binIdx.codeUnits.forEach((code) {
      result += numberToHex(code);
    });
    return result;
  }
}
