part of 'project_bloc.dart';

@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState.initial() = _Initial;

  const factory ProjectState.loading() = _Loading;

  const factory ProjectState.projects(List<Project> forecast) = _ProjectInformation;

  const factory ProjectState.failed(Failure failure) = _Failed;
}
