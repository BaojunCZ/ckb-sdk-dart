part of 'package:ckb_sdk/ckb_rpc.dart';

class ApiRequest {
  int id = 0;
  final jsonrpc = "2.0";
  String _nodeUrl;

  ApiRequest(String nodeUrl) {
    _nodeUrl = nodeUrl;
  }

  requestRpc(String url, List params) async {
    var body = {"jsonrpc": jsonrpc, "id": id};
    body["method"] = url;
    body["params"] = params;
    var response = await http
        .post(_nodeUrl, headers: {'Content-type': 'application/json'}, body: jsonEncode(body))
        .timeout(Duration(seconds: 20), onTimeout: () {
      throw RPCTimeOutException(url);
    });
    id = id + 1;
    if (response.statusCode == 200) {
      return handlerResult(url, body, response.body);
    } else {
      throw RPCRequestException("Request failed with status: ${response.statusCode}.", url);
    }
  }

  handlerResult(url, body, data) {
    if (null == data) {
      throw EmptyResponseException(url);
    }
    var json = jsonDecode(data);
    if (null == json) {
      throw EmptyResponseException(url);
    }
    if (null != json["error"]) {
      var error = json["error"];
      throw RPCErrorException(RPCError(error["code"], error["message"]), url);
    }
    return json;
  }
}
