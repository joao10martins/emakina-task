import 'package:dartz/dartz.dart';
import 'package:emakina_task/core/error/failures.dart';
import 'package:emakina_task/core/usecases/usecase.dart';
import 'package:emakina_task/data/models/project.dart';
import 'package:emakina_task/features/projects/repositories/repo_interfaces/project_repository.dart';

abstract class GetProjects extends UseCase<List<Project>, NoParams> {}

class GetProjectsImpl extends GetProjects {
  GetProjectsImpl(this._repository);

  final ProjectRepository _repository;

  @override
  Future<Either<Failure, List<Project>>> execute(NoParams params) {
    return _repository.getProjects();
  }
}
