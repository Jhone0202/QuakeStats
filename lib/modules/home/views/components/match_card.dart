import 'package:flutter/material.dart';
import 'package:software_engineer_test/modules/shared/models/match_model.dart';
import 'package:software_engineer_test/modules/home/views/components/player_tile.dart';
import 'package:software_engineer_test/modules/report_of_deaths/view/report_of_deaths_page.dart';
import 'package:software_engineer_test/modules/theme/app_theme.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({
    Key? key,
    required this.match,
  }) : super(key: key);

  final Match match;

  @override
  Widget build(BuildContext context) {
    match.kills.sort((a, b) => b.kills.compareTo(a.kills));
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.colors.secondaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            match.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            'Total Kills: ${match.totalKills}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Divider(
            height: 32,
            color: AppTheme.colors.tertiaryColor,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: match.kills.length,
            itemBuilder: (context, index) => PlayerTile(
              kill: match.kills[index],
              index: index,
            ),
          ),
          Divider(
            height: 32,
            color: AppTheme.colors.tertiaryColor,
          ),
          TextButton(
            onPressed: match.deathReports.isEmpty
                ? null
                : () => Navigator.pushNamed(
                      context,
                      ReportOfDeathsPage.routeName,
                      arguments: match,
                    ),
            style: TextButton.styleFrom(
              primary: AppTheme.colors.primaryColor,
              visualDensity: VisualDensity.compact,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Report of Deaths'),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
