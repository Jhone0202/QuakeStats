// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyHomeStore on MyHomeStoreBase, Store {
  final _$loadingAtom = Atom(name: 'MyHomeStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$onlyKillsAtom = Atom(name: 'MyHomeStoreBase.onlyKills');

  @override
  bool get onlyKills {
    _$onlyKillsAtom.reportRead();
    return super.onlyKills;
  }

  @override
  set onlyKills(bool value) {
    _$onlyKillsAtom.reportWrite(value, super.onlyKills, () {
      super.onlyKills = value;
    });
  }

  final _$matchListAtom = Atom(name: 'MyHomeStoreBase.matchList');

  @override
  ObservableList<Match> get matchList {
    _$matchListAtom.reportRead();
    return super.matchList;
  }

  @override
  set matchList(ObservableList<Match> value) {
    _$matchListAtom.reportWrite(value, super.matchList, () {
      super.matchList = value;
    });
  }

  final _$onlyKillsListAtom = Atom(name: 'MyHomeStoreBase.onlyKillsList');

  @override
  ObservableList<Match> get onlyKillsList {
    _$onlyKillsListAtom.reportRead();
    return super.onlyKillsList;
  }

  @override
  set onlyKillsList(ObservableList<Match> value) {
    _$onlyKillsListAtom.reportWrite(value, super.onlyKillsList, () {
      super.onlyKillsList = value;
    });
  }

  final _$newGameAtom = Atom(name: 'MyHomeStoreBase.newGame');

  @override
  Match? get newGame {
    _$newGameAtom.reportRead();
    return super.newGame;
  }

  @override
  set newGame(Match? value) {
    _$newGameAtom.reportWrite(value, super.newGame, () {
      super.newGame = value;
    });
  }

  final _$initStoreAsyncAction = AsyncAction('MyHomeStoreBase.initStore');

  @override
  Future<dynamic> initStore() {
    return _$initStoreAsyncAction.run(() => super.initStore());
  }

  final _$readLogAsyncAction = AsyncAction('MyHomeStoreBase.readLog');

  @override
  Future<dynamic> readLog() {
    return _$readLogAsyncAction.run(() => super.readLog());
  }

  final _$MyHomeStoreBaseActionController =
      ActionController(name: 'MyHomeStoreBase');

  @override
  void filterMatches(bool active) {
    final _$actionInfo = _$MyHomeStoreBaseActionController.startAction(
        name: 'MyHomeStoreBase.filterMatches');
    try {
      return super.filterMatches(active);
    } finally {
      _$MyHomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
onlyKills: ${onlyKills},
matchList: ${matchList},
onlyKillsList: ${onlyKillsList},
newGame: ${newGame}
    ''';
  }
}
