class Response<T> {
  Response(this.id, this.jsonrpc, this.result, this.error);
  int id;
  String jsonrpc;
  T result;
  Error error;
}

class Error {
  Error(this.code, this.message, this.data);
  int code;
  String message;
  String data;

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
        json['code'] as int, json['message'] as String, json['data'] as String);
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': this.code,
        'message': this.message,
        'data': this.data
      };
}
