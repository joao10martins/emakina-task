import 'package:emakina_task/features/projects/repositories/repo_impl/project_repository_impl.dart';
import 'package:emakina_task/features/projects/repositories/repo_interfaces/project_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emakina_task/core/theme/theme.dart';

import 'router.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.appName}) : super(key: key);

  final String appName;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProjectRepository>(
          create: (BuildContext context) => ProjectRepositoryImpl(),
        ),
      ],
      child: MaterialApp(
        title: appName,
        theme: getAppTheme(context),
        darkTheme: getAppTheme(context),
        initialRoute: '/',
        onGenerateRoute: (settings) => router(settings),
      ),
    );
  }
}
