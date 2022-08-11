import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:emakina_task/core/error/failures.dart';
import 'package:emakina_task/data/models/project.dart';
import 'package:emakina_task/features/projects/repositories/repo_interfaces/project_repository.dart';
import 'package:flutter/services.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  ProjectRepositoryImpl();

  @override
  Future<Either<Failure, List<Project>>> getProjects() async {
    try {
      final String response = await rootBundle.loadString('assets/projectData/data.json');

      return Right(List<Project>.from(jsonDecode(response).map((data) => Project.fromJson(data))));
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(ClientFailure(e));
    }
  }
}
