import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:software_engineer_test/modules/shared/models/kill_model.dart';
import 'package:software_engineer_test/modules/theme/app_theme.dart';

class PlayerTile extends StatelessWidget {
  const PlayerTile({
    Key? key,
    required this.kill,
    required this.index,
  }) : super(key: key);

  final Kill kill;
  final int index;

  Color randomColor(int index) {
    return index > AppTheme.colors.randomColors.length - 1
        ? Colors.white.withOpacity(0.85)
        : AppTheme.colors.randomColors[index];
  }

  Color killColor(int nKills) {
    return nKills >= 0 ? Colors.white : AppTheme.colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppTheme.colors.tertiaryColor,
            child: Icon(FeatherIcons.user, color: randomColor(index)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kill.playerName,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  '${kill.kills} Kills',
                  style: TextStyle(color: killColor(kill.kills)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
