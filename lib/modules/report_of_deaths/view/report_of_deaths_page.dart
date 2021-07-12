import 'package:flutter/material.dart';
import 'package:software_engineer_test/modules/shared/models/match_model.dart';
import 'package:software_engineer_test/modules/report_of_deaths/view/components/death_report_tile.dart';

class ReportOfDeathsPage extends StatelessWidget {
  const ReportOfDeathsPage({Key? key}) : super(key: key);

  static const String routeName = '/reportOfDeaths';

  @override
  Widget build(BuildContext context) {
    final match = ModalRoute.of(context)?.settings.arguments as Match;
    match.deathReports.sort((a, b) => b.kills.compareTo(a.kills));
    return Scaffold(
      appBar: AppBar(
        title: Text('Report od Deaths - ${match.name}'),
      ),
      body: SafeArea(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          itemCount: match.deathReports.length,
          itemBuilder: (context, index) => DeathReportTile(
            deathReport: match.deathReports[index],
            index: index,
          ),
        ),
      ),
    );
  }
}
