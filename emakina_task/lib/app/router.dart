import 'package:emakina_task/features/privacy_policy/pages/privacy_policy_page.dart';
import 'package:emakina_task/features/projects/pages/projects_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:emakina_task/features/home/pages/home_page.dart';

class Routes {
  static const kHomePage = '/';
  static const kProjectsPage = '/projects';
  static const kPrivacyPolicyPage = '/privacy-policy';
}

Route<dynamic> router(RouteSettings settings) {
  switch (settings.name) {
    case Routes.kHomePage:
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );
    case Routes.kProjectsPage:
      return MaterialPageRoute(
        builder: (context) => ProjectsPage(),
      );
    case Routes.kPrivacyPolicyPage:
      return MaterialPageRoute(
        builder: (context) => PrivacyPolicyPage(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Text('Placeholder'),
      );
  }
}
