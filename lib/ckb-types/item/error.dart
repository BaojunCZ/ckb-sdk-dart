/*
 * @Author: BaojunCZ
 * @Date: 2019-01-11 13:39:39
 * @LastEditors: your name
 * @LastEditTime: 2019-01-11 18:32:45
 * @Description: file content
 */
class RPCError {
  RPCError(this.code, this.message);
  int code;
  String message;

  factory RPCError.fromJson(Map<String, dynamic> json) {
    return RPCError(json['code'] as int, json['message'] as String);
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': this.code,
        'message': this.message,
      };
}
