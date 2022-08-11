import 'package:emakina_task/app/resources/strings.dart';
import 'package:emakina_task/core/error/failures.dart';
import 'package:emakina_task/data/models/project.dart';
import 'package:emakina_task/features/projects/bloc/project_bloc.dart';
import 'package:emakina_task/features/projects/widgets/project_list_item.dart';
import 'package:emakina_task/features/widgets/failure_view.dart';
import 'package:emakina_task/features/widgets/progress_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ProjectBloc.fromContext(context)..load();
      },
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        appBar: AppBar(
          title: Text(Strings.projectsPageTitle),
        ),
        body: PageBody(context: context),
      ),
    );
  }
}

class PageBody extends StatelessWidget {
  const PageBody({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (BuildContext context, ProjectState state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const ProgressView(),
          projects: (List<Project> projects) => ProjectList(context: context, projects: projects),
          failed: (Failure failure) => Center(
            child: FailureView(
              failure: failure,
            ),
          ),
        );
      },
    );
  }
}

class ProjectList extends StatelessWidget {
  const ProjectList({
    Key? key,
    required this.context,
    required this.projects,
  }) : super(key: key);

  final BuildContext context;
  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemBuilder: (BuildContext context, int index) {
        return ProjectListItem(projects[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 12);
      },
      itemCount: projects.length,
    );
  }
}
