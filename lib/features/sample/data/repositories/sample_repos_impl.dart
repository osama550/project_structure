import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:project_structure/core/errors/exceptions.dart';
import 'package:project_structure/core/errors/failure.dart';
import 'package:project_structure/features/sample/data/datasources/sample_remote_data_source.dart';
import 'package:project_structure/features/sample/domain/entities/sample_entity.dart';
import 'package:project_structure/features/sample/domain/repositories/sample_repos.dart';

class SampleReposImpl implements SampleRepos {
  final SampleRemoteDataSource remoteDataSource;

  SampleReposImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, SampleEntity>> getSample() async {
    try {
      final sample = await remoteDataSource.getSample();
      return Right(sample.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorModel.errorMessage,
        statusCode: e.errorModel.status,
      ));
    } on Exception catch (e, st) {
      log('Unexpected error loading sample', error: e, stackTrace: st);
      return const Left(
        UnexpectedFailure(errorMessage: 'Something went wrong'),
      );
    }
  }
}
