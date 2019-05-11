class Cycles {
  String cycles;

  Cycles(this.cycles);

  factory Cycles.fromJson(Map<String, dynamic> json) => Cycles(
        json['cycles'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'cycles': cycles,
      };
}
