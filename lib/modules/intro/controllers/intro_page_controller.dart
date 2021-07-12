import 'package:url_launcher/url_launcher.dart';

class IntroPageController {
  final String devProfile = 'https://github.com/Jhone0202';
  final String testRepository =
      'https://gist.github.com/cloudwalk-tests/704a555a0fe475ae0284ad9088e203f1';

  Future launchRepository() async {
    final String url = testRepository;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future launchProfile() async {
    final String url = devProfile;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
