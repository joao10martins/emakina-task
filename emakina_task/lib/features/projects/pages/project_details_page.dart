
import 'package:emakina_task/data/models/project.dart';
import 'package:flutter/material.dart';

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage(this._selectedProject, this._scrollController, {Key? key}) : super(key: key);

  final Project _selectedProject;
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${_selectedProject.name}',
          ),
        ),
        body: ProjectDetailsBody(selectedProject: _selectedProject, scrollController: _scrollController, context: context),
      );

  }
}

class ProjectDetailsBody extends StatelessWidget {
  const ProjectDetailsBody({
    Key? key,
    required Project selectedProject,
    required ScrollController scrollController,
    required this.context,
  }) : selectedProject = selectedProject, scrollController = scrollController, super(key: key);

  final Project selectedProject;
  final ScrollController scrollController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      controller: scrollController,
      child: Column(
        children: [
          Image.asset('assets/projectPictures/${selectedProject.image}.jpg'),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ProjectDetailsInfo(project: selectedProject),
          ),
        ],
      ),
    );
  }
}

class ProjectDetailsInfo extends StatelessWidget {
  const ProjectDetailsInfo({Key? key, required this.project}) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.name,
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: 6),
        Text(
          project.location,
          style: Theme.of(context).textTheme.caption,
        ),
        const SizedBox(height: 6),
        Text(
          project.description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

