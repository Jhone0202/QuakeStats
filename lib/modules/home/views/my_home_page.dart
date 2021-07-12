import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:software_engineer_test/modules/home/repositories/read_log_repository.dart';
import 'package:software_engineer_test/modules/home/views/components/filter_button.dart';
import 'package:software_engineer_test/modules/home/views/components/match_card.dart';
import 'package:software_engineer_test/modules/theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../stores/my_home_store.dart';

class MyHomePage extends StatelessWidget {
  static const String routeName = '/myHomePage';

  final store = MyHomeStore(repository: ReadLogRepository());

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (store.loading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  SvgPicture.asset('assets/quake-icon.svg'),
                  const SizedBox(width: 16),
                  Text('Quake'),
                  Text(
                    '.log',
                    style: TextStyle(color: AppTheme.colors.primaryColor),
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: AppTheme.colors.secondaryColor,
                    child: Row(
                      children: [
                        FilterButton(
                          press: () => store.filterMatches(false),
                          text: 'All Matches (${store.matchList.length})',
                          active: !store.onlyKills,
                        ),
                        const SizedBox(width: 16),
                        FilterButton(
                          press: () => store.filterMatches(true),
                          text: 'Only Kills (${store.onlyKillsList.length})',
                          active: store.onlyKills,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 1,
                    color: AppTheme.colors.tertiaryColor,
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(16),
                      itemCount: store.onlyKills
                          ? store.onlyKillsList.length
                          : store.matchList.length,
                      itemBuilder: (context, index) => MatchCard(
                        match: store.onlyKills
                            ? store.onlyKillsList[index]
                            : store.matchList[index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
