import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import '../lib/ckb-rpc/service_url.dart';
import 'dart:convert';

void main() {
  test("test rpc", () async {
    var url = "http://192.168.2.203:8114/";
    var body = {
      "jsonrpc": "2.0",
      "id": 2,
      "method": ServiceUrl.blockHash,
      "params": [1]
    };
    print(jsonEncode(body));
    var params = 1;
    String bodyStr = '{"jsonrpc":"2.0","id":2,"method":"${ServiceUrl.blockHash}","params":[${jsonEncode(params)}]}';
    print(bodyStr);
    var response = await http.post(url, headers: {'Content-type': 'application/json'}, body: bodyStr);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  });

  test("test transaction", () async {
    var url = "http://192.168.2.203:8114/";
    var body ='{"jsonrpc":"2.0","id":160,"method":"send_transaction","params":[{"hash":null,"deps":[{"hash":"0x15c809f08c7bca63d2b661e1dbc26c74551a6f982f7631c718dc43bd2bb5c90e","index":0}],"inputs":[{"previous_output":{"hash":"0x95032fc6cc6c184516c17b39ec23277a65a651195f2c36948edc0359e9f222c7","index":0},"unlock":{"args":[],"binary":null,"reference":"0xbe53efec824349f8b8bd9cfa93ccee25c6e1d544e6bd686f720a4c27d933cd71","signed_args":[],"version":0,"typeHash":"0x0da2fe99fe549e082d4ed483c2e968a89ea8d11aabf5d79e5cbf06522de6e674"}}],"outputs":[{"capacity":1000,"data":"0x3077","lock":"0xcf7eae49ba7f8948af053b59d1283e8a6bdd1b99b6a2d3fb7020438dd27557ca","type":null},{"capacity":4999000,"data":"0x3077","lock":"0x0da2fe99fe549e082d4ed483c2e968a89ea8d11aabf5d79e5cbf06522de6e674","type":null}],"version":0}]}';
    var response = await http.post(url, headers: {'Content-type': 'application/json'}, body: body);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  });
}
