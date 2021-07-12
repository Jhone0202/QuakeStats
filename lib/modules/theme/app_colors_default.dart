import 'dart:ui';

import 'package:software_engineer_test/modules/theme/app_colors_interface.dart';

class AppColorsDefault extends IAppColors {
  @override
  Color get background => Color(0xFF12111A);

  @override
  Color get primaryColor => Color(0xFF7A7EFF);

  @override
  Color get secondaryColor => Color(0xFF1E1E2C);

  @override
  Color get tertiaryColor => Color(0xFF28283D);

  @override
  Color get red => Color(0xFFFF78A5);

  @override
  List<Color> get randomColors => [
        Color(0xFF7A7EFF),
        Color(0xFFFF78A5),
        Color(0xFFC17AFD),
        Color(0xFF8AC8FE),
        Color(0xFFFEFFA8),
        Color(0xFF7AFF87),
      ];
}
