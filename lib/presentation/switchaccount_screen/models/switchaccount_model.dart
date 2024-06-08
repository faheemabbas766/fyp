class Party {
  final int id;
  final String partyName;
  final String partyFlag;
  final String partySymbol;

  Party({
    required this.id,
    required this.partyName,
    required this.partyFlag,
    required this.partySymbol,
  });

  factory Party.fromJson(Map<String, dynamic> json) {
    return Party(
      id: json['id'] as int,
      partyName: json['party_name'] as String,
      partyFlag: json['party_flag'] as String,
      partySymbol: json['party_symbol'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'party_name': partyName,
      'party_flag': partyFlag,
      'party_symbol': partySymbol,
    };
  }
}
