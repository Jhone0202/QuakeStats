import 'dart:convert';

class DeathReport {
  String deathCause;
  int kills;

  DeathReport({
    required this.deathCause,
    required this.kills,
  });

  Map<String, dynamic> toMap() {
    return {
      'deathCause': deathCause,
      'kills': kills,
    };
  }

  factory DeathReport.fromMap(Map<String, dynamic> map) {
    return DeathReport(
      deathCause: map['deathCause'],
      kills: map['kills'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DeathReport.fromJson(String source) =>
      DeathReport.fromMap(json.decode(source));
}
