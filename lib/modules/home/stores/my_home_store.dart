import 'package:mobx/mobx.dart';
import 'package:software_engineer_test/modules/home/interfaces/read_log_interface.dart';
import 'package:software_engineer_test/modules/shared/models/death_report.dart';
import 'package:software_engineer_test/modules/shared/models/match_model.dart';

import '../../shared/models/kill_model.dart';

part 'my_home_store.g.dart';

class MyHomeStore = MyHomeStoreBase with _$MyHomeStore;

abstract class MyHomeStoreBase with Store {
  final IReadLog repository;

  MyHomeStoreBase({required this.repository}) {
    initStore();
  }

  @observable
  bool loading = false;

  @observable
  bool onlyKills = false;

  @observable
  ObservableList<Match> matchList = ObservableList<Match>();

  @observable
  ObservableList<Match> onlyKillsList = ObservableList<Match>();

  @observable
  Match? newGame;

  @action
  Future initStore() async {
    loading = true;
    await readLog();
    loading = false;
  }

  @action
  void filterMatches(bool active) {
    onlyKills = active;
  }

  @action
  Future readLog() async {
    final list = await repository.loadLogFile('assets/qgames.log');
    bool iniciado = false;
    for (var line in list) {
      if (line.contains('InitGame') && iniciado == false) {
        newGame = repository.newGame('Game ${matchList.length + 1}');
        iniciado = true;
      }

      if (line.contains('killed')) {
        newGame!.totalKills++;
        if (killByPlayer(line)) {
          final replaced = line.replaceAll(RegExp(r'[0-9]'), '');

          final death = extractName(
            start: 'by ',
            end: '',
            line: replaced,
          );

          if (reportIsRepeated(death)) {
            newGame!.deathReports
                .firstWhere((e) => e.deathCause == death)
                .kills++;
          } else {
            newGame!.deathReports.add(DeathReport(deathCause: death, kills: 1));
          }

          final name = extractName(
            start: 'Kill:   : ',
            end: ' killed',
            line: replaced,
          );

          if (isRepeated(name)) {
            newGame!.kills.firstWhere((e) => e.playerName == name).kills++;
          } else {
            newGame!.kills.add(Kill(playerName: name, kills: 1));
          }
        } else {
          final name = extractName(start: 'killed ', end: ' by', line: line);

          if (isRepeated(name)) {
            newGame!.kills.firstWhere((e) => e.playerName == name).kills--;
          } else {
            newGame!.kills.add(Kill(playerName: name, kills: -1));
          }
        }
      }

      if (line.contains('ClientUserinfoChanged')) {
        final player = extractName(start: ' n\\', end: '\\t', line: line);

        if (!newGame!.players.contains(player)) {
          newGame!.players.add(player);
          if (!isRepeated(player)) {
            newGame!.kills.add(Kill(playerName: player, kills: 0));
          }
        }
      }

      if (line.contains('InitGame') && iniciado) {
        matchList.add(newGame!);
        iniciado = false;
      }
    }
    onlyKillsList.addAll(matchList.where((e) => e.totalKills > 0));
  }

  bool killByPlayer(String line) {
    return !line.contains('<world>');
  }

  String extractName(
      {required String line, required String start, required String end}) {
    final startIndex = line.indexOf(start);
    final endIndex = end.isEmpty
        ? line.length
        : line.indexOf(end, startIndex + start.length);
    return line.substring(startIndex + start.length, endIndex);
  }

  bool isRepeated(String name) {
    final find = newGame?.kills.firstWhere(
      (e) => e.playerName == name,
      orElse: () => Kill(kills: 0, playerName: ''),
    );
    return find!.playerName.isNotEmpty;
  }

  bool reportIsRepeated(String deathCause) {
    final find = newGame?.deathReports.firstWhere(
      (e) => e.deathCause == deathCause,
      orElse: () => DeathReport(deathCause: '', kills: 0),
    );
    return find!.deathCause.isNotEmpty;
  }
}
