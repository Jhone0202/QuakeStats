import 'package:software_engineer_test/modules/shared/models/match_model.dart';

abstract class IReadLog {
  Match newGame(String name);
  Future<List<String>> loadLogFile(String path);
}
