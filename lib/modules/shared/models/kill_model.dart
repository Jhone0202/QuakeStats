import 'dart:convert';

class Kill {
  String playerName;
  int kills;

  Kill({
    required this.playerName,
    required this.kills,
  });

  Map<String, dynamic> toMap() {
    return {
      'playerName': playerName,
      'kills': kills,
    };
  }

  factory Kill.fromMap(Map<String, dynamic> map) {
    return Kill(
      playerName: map['playerName'],
      kills: map['kills'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Kill.fromJson(String source) => Kill.fromMap(json.decode(source));
}
