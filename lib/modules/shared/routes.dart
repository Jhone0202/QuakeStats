import 'package:flutter/cupertino.dart';
import 'package:software_engineer_test/modules/home/views/my_home_page.dart';
import 'package:software_engineer_test/modules/intro/views/intro_page.dart';
import 'package:software_engineer_test/modules/report_of_deaths/view/report_of_deaths_page.dart';

final Map<String, WidgetBuilder> routes = {
  IntroPage.routeName: (BuildContext context) => IntroPage(),
  MyHomePage.routeName: (BuildContext context) => MyHomePage(),
  ReportOfDeathsPage.routeName: (BuildContext context) => ReportOfDeathsPage(),
};
