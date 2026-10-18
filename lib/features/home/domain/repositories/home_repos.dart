import 'package:dartz/dartz.dart';
import 'package:project_structure/core/errors/failure.dart';
import 'package:project_structure/features/home/domain/entities/home_entity.dart';

abstract class HomeRepos {
  Future<Either<Failure, HomeEntity>> getHomeData();
}
