import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emakina_task/core/theme/theme.dart';
/*import 'package:emakina_task/features/location/data/repositories/location_repository_impl.dart';
import 'package:emakina_task/features/location/domain/repositories/location_repository.dart';
import 'package:emakina_task/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:emakina_task/features/weather/domain/repositories/weather_repository.dart';*/

import 'router.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.appName}) : super(key: key);

  final String appName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: getAppTheme(context),
      darkTheme: getAppTheme(context),
      initialRoute: '/',
      onGenerateRoute: (settings) => router(settings),
    );
  }
}
