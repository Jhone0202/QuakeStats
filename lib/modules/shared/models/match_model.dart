import 'dart:convert';

import 'package:software_engineer_test/modules/shared/models/death_report.dart';
import 'package:software_engineer_test/modules/shared/models/kill_model.dart';

class Match {
  String name;
  int totalKills;
  List<String> players;
  List<Kill> kills;
  List<DeathReport> deathReports;

  Match({
    required this.name,
    required this.totalKills,
    required this.players,
    required this.kills,
    required this.deathReports,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'totalKills': totalKills,
      'players': players,
      'kills': kills.map((x) => x.toMap()).toList(),
      'deathReports': deathReports.map((x) => x.toMap()).toList(),
    };
  }

  factory Match.fromMap(Map<String, dynamic> map) {
    return Match(
      name: map['name'],
      totalKills: map['totalKills'],
      players: List<String>.from(map['players']),
      kills: List<Kill>.from(map['kills']?.map((x) => Kill.fromMap(x))),
      deathReports: List<DeathReport>.from(
          map['deathReports']?.map((x) => DeathReport.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Match.fromJson(String source) => Match.fromMap(json.decode(source));
}
