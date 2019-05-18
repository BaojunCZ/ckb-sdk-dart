class PeerState {
  String lastUpdate;
  String blocksInFlight;
  String peer;

  PeerState(this.lastUpdate, this.blocksInFlight, this.peer);

  factory PeerState.fromJson(Map<String, dynamic> json) => PeerState(
        json['last_updated'] as String,
        json['blocks_in_flight'] as String,
        json['peer'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'last_updated': lastUpdate,
        'blocks_in_flight': blocksInFlight,
        'peer': peer,
      };
}
