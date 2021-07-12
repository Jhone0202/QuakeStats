import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:software_engineer_test/modules/home/views/my_home_page.dart';
import 'package:software_engineer_test/modules/intro/controllers/intro_page_controller.dart';
import 'package:software_engineer_test/modules/theme/app_theme.dart';

class IntroPage extends StatelessWidget {
  static const String routeName = '/';
  IntroPage({Key? key}) : super(key: key);

  final controller = IntroPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset('assets/dev-flatline.svg'),
              Text(
                'Wellcome to QuakeStats',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              Text(
                '''Result of a test aimed at candidates applying for Software Engineering positions at CloudWalk.''',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const Spacer(flex: 2),
              TextButton(
                onPressed: controller.launchProfile,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Developed by ',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Maicon Jhone',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.colors.primaryColor,
                          ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(
                  context,
                  MyHomePage.routeName,
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  primary: Colors.white,
                  backgroundColor: AppTheme.colors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: Text('Go to Home Page'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: controller.launchRepository,
                style: TextButton.styleFrom(
                  primary: AppTheme.colors.primaryColor,
                ),
                child: Text('Test Repository'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
