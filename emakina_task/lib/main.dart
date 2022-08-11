import 'package:emakina_task/app/resources/strings.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App(
    appName: Strings.appTitle,
  ));
}