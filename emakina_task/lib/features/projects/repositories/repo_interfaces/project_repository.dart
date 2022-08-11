import 'package:dartz/dartz.dart';
import 'package:emakina_task/core/error/failures.dart';
import 'package:emakina_task/data/models/project.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<Project>>> getProjects();
}
