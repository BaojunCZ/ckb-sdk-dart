class Script {
  final String ALWAYS_SUCCESS_HASH = "0000000000000000000000000000000000000000000000000000000000000001";

  String codeHash;
  List<String> args;

  Script(this.codeHash, this.args);

  Script alwaysSuccess() => Script(ALWAYS_SUCCESS_HASH, []);

  factory Script.fromJson(Map<String, dynamic> json) => Script(
        json['code_hash'] as String,
        (json['args'] as List)?.map((e) => e as String)?.toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code_hash': codeHash,
        'args': args,
      };
}
