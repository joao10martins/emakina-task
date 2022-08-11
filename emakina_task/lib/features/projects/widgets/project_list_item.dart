import 'package:emakina_task/data/models/project.dart';
import 'package:flutter/material.dart';

class ProjectListItem extends StatelessWidget {
  const ProjectListItem(this.project, {Key? key}) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: CardBody(project: project, context: context),
    );
  }
}

class CardBody extends StatelessWidget {
  const CardBody({
    Key? key,
    required this.project,
    required this.context,
  }) : super(key: key);

  final Project project;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Image.asset(
            'assets/projectPictures/${project.image}.jpg',
            height: 80,
            width: 80,
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(project.name),
                const SizedBox(height: 12),
                Text(
                  project.location,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
