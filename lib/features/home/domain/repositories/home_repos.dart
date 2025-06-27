import 'package:dartz/dartz.dart';
import 'package:project_structure/core/errors/failure.dart';
import 'package:project_structure/features/home/data/models/home_model.dart';

abstract class HomeRepos {
  Future<Either<Failure, HomeModel>> getHomeData();
}
