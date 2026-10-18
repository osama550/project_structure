import 'package:dartz/dartz.dart';
import 'package:project_structure/core/errors/failure.dart';
import 'package:project_structure/features/home/domain/entities/home_entity.dart';
import 'package:project_structure/features/home/domain/repositories/home_repos.dart';

class GetHomeUseCase {
  final HomeRepos _repository;
  GetHomeUseCase(this._repository);

  Future<Either<Failure, HomeEntity>> call() => _repository.getHomeData();
}
