import 'package:emakina_task/app/resources/strings.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.projectsPageTitle),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Text('Projects'),
          ),
        ),
      ),
    );
  }
}
