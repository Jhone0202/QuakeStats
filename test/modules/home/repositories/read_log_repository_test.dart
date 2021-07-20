import 'package:flutter_test/flutter_test.dart';
import 'package:software_engineer_test/modules/home/repositories/read_log_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final repository = ReadLogRepository();
  final logFilePath = 'assets/qgames.log';

  test('Log file for the test found', () async {
    final res = await repository.loadLogFile(logFilePath);
    final bool notEmpty = res.isNotEmpty;
    expect(notEmpty, true);
  });

  test('Create new math object', () {
    final match = repository.newGame('New_Game_Test');
    expect(match.name, 'New_Game_Test');
  });
}
