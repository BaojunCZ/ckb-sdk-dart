class TraceTransaction {
  String action;
  String info;
  int time;

  TraceTransaction(this.action, this.info, this.time);

  factory TraceTransaction.fromJson(Map<String, dynamic> json) =>
      TraceTransaction(json['action'] as String, json['info'] as String,
          json['time'] as int);
}
