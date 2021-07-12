import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:software_engineer_test/modules/shared/models/death_report.dart';
import 'package:software_engineer_test/modules/theme/app_theme.dart';

class DeathReportTile extends StatelessWidget {
  const DeathReportTile({
    Key? key,
    required this.deathReport,
    required this.index,
  }) : super(key: key);

  final DeathReport deathReport;
  final int index;

  Color randomColor(int index) {
    return index > AppTheme.colors.randomColors.length - 1
        ? Colors.white.withOpacity(0.85)
        : AppTheme.colors.randomColors[index];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppTheme.colors.tertiaryColor,
            child: Icon(FeatherIcons.crosshair, color: randomColor(index)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deathReport.deathCause,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text('${deathReport.kills} Kills'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
