import 'package:flutter/material.dart';
import 'package:software_engineer_test/modules/theme/app_theme.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
    required this.press,
    required this.text,
    required this.active,
  }) : super(key: key);

  final VoidCallback press;
  final String text;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(8),
        backgroundColor: active
            ? AppTheme.colors.primaryColor
            : AppTheme.colors.tertiaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .subtitle2!
            .copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
