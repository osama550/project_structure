import 'package:dartz/dartz.dart';
import 'package:project_structure/core/errors/failure.dart';
import 'package:project_structure/features/sample/domain/entities/sample_entity.dart';

abstract class SampleRepos {
  Future<Either<Failure, SampleEntity>> getSample();
}
