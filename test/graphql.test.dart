import 'dart:io';
import 'package:http/http.dart' as http;

void main() async {
  http_post_test();
}

http_get_test() async {
  var url = "http://localhost:4000/graphql?query={ quoteOfTheDay , random , rollDice(numDice: 3, numSides: 6)}";
  var response = await http.get(url);
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print("Request failed with status: ${response.statusCode}.");
  }
}

http_post_test() async {
  var url = "http://localhost:4000/graphql";
  var response = await http.post(url, body: {"query": "{ quoteOfTheDay , random , rollDice(numDice: 3, numSides: 6)}"});
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print("Request failed with status: ${response.statusCode}.");
  }
}
