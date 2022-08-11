import 'package:dartz/dartz.dart';
import 'package:emakina_task/core/error/failures.dart';
import 'package:emakina_task/core/usecases/usecase.dart';
import 'package:emakina_task/data/models/project.dart';
import 'package:emakina_task/features/projects/repositories/repo_interfaces/project_repository.dart';
import 'package:emakina_task/features/projects/usecases/get_projects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_bloc.freezed.dart';

part 'project_state.dart';

class ProjectBloc extends Cubit<ProjectState> {
  @visibleForTesting
  ProjectBloc(this._getProjects) : super(const ProjectState.initial());

  factory ProjectBloc.fromContext(BuildContext context) {
    return ProjectBloc(
      GetProjectsImpl(
        context.read<ProjectRepository>(),
      ),
    );
  }

  final GetProjects _getProjects;

  Future<void> load() async {
    emit(const ProjectState.loading());

    try {
      final Either<Failure, List<Project>> eitherResults = await _getProjects.execute(NoParams());
      eitherResults.fold(
            (Failure failure) => emit(ProjectState.failed(failure)),
            (List<Project> projects) => emit(ProjectState.projects(projects)),
      );
    } catch (e) {
      emit(ProjectState.failed(ClientFailure(e)));
    }
  }
}
