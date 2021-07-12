import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:software_engineer_test/modules/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_engineer_test/modules/shared/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      title: 'Software Engineer Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: AppTheme.colors.primaryColor,
        accentColor: AppTheme.colors.primaryColor,
        scaffoldBackgroundColor: AppTheme.colors.background,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        appBarTheme: AppBarTheme(
          backgroundColor: AppTheme.colors.secondaryColor,
          elevation: 0,
        ),
      ),
      routes: routes,
    );
  }
}
