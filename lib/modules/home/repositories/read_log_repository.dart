import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:software_engineer_test/modules/home/interfaces/read_log_interface.dart';
import 'package:software_engineer_test/modules/shared/models/match_model.dart';

class ReadLogRepository extends IReadLog {
  @override
  Match newGame(String name) {
    return Match(
      name: name,
      totalKills: 0,
      players: [],
      kills: [],
      deathReports: [],
    );
  }

  @override
  Future<List<String>> loadLogFile(String path) async {
    String jolo = await rootBundle.loadString(path);
    List<String> list = LineSplitter().convert(jolo).map((e) => e).toList();
    return list;
  }
}
