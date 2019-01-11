import 'package:test/test.dart';
import '../../lib/api/api_client.dart';

void main() {
  final apiClient = new ApiClient("http://192.168.2.203:8114/");

  test("genesisBlockHash", () async {
    try {
      BlockHashRes blockHashRes = await apiClient.genesisBlockHash();
      expect(blockHashRes.result != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("genesisBlock", () async {
    try {
      BlockRes blockRes = await apiClient.genesisBlock();
      expect(blockRes.result != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  test("get block hash", () async {
    try {
      BlockHashRes blockHashRes = await apiClient.getBlockHash(1);
      expect(blockHashRes.result != null, true);
    } catch (error) {
      print(error.message);
      expect(error.code, -1);
    }
  });

  group("get transaction", () {
    test("with right params", () async {
      String hash =
          "0x3abd21e6e51674bb961bb4c5f3cee9faa5da30e64be10628dc1cef292cbae324";
      TransationRes transaction = await apiClient.getTransaction(hash);
      if (transaction.error == null) {
        expect(transaction.result.hash, hash);
      } else {
        print(transaction.error.message);
        expect(transaction.error.code, -1);
      }
    });

    test("with wrong params", () async {
      String hash = "0x3f292cbae324";
      TransationRes transaction = await apiClient.getTransaction(hash);
      if (transaction.error == null) {
        expect(transaction.result.hash, hash);
      } else {
        print(transaction.error.message);
        expect(transaction.error.code, -1);
      }
    });
  });
}
