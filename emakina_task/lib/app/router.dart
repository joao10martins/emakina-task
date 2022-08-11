import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:emakina_task/features/home/pages/home_page.dart';

class Routes {
  static const kHomePage = '/';
  static const kPrivacyPolicyPage = '/privacy-policy';
}

Route<dynamic> router(RouteSettings settings) {
  switch (settings.name) {
    case Routes.kHomePage:
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );
    /*case Routes.kPrivacyPolicyPage:
      //final ForecastPageArgument forecastPageArgument = settings.arguments as ForecastPageArgument;
      return MaterialPageRoute(
        builder: (context) => ForecastPage(
          numberOfDays: forecastPageArgument.numberOfDays,
          location: forecastPageArgument.location,
        ),
      );*/
    default:
      return MaterialPageRoute(
        builder: (context) => const Text('Placeholder'),
      );
  }
}
