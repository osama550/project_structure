import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:project_structure/core/connection/network_info.dart';
import 'package:project_structure/core/errors/exceptions.dart';
import 'package:project_structure/core/errors/failure.dart';
import 'package:project_structure/features/home/data/datasources/home_local_data_source.dart';
import 'package:project_structure/features/home/data/datasources/home_remote_data_source.dart';
import 'package:project_structure/features/home/domain/entities/home_entity.dart';
import 'package:project_structure/features/home/domain/repositories/home_repos.dart';

class HomeReposImpl implements HomeRepos {
  final NetworkInfo networkInfo;
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeReposImpl(this.networkInfo, this.remoteDataSource, this.localDataSource);
  @override
  Future<Either<Failure, HomeEntity>> getHomeData() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteHome = await remoteDataSource.getHomeData();
        try {
          await localDataSource.saveHomeData(remoteHome);
        } on CacheException catch (e) {
          // A failed cache write must not fail a successful fetch.
          log('Home cache write failed: ${e.errorMessage}');
        }
        return Right(remoteHome.toEntity());
      } on ServerException catch (e) {
        return Left(ServerFailure(
          errorMessage: e.errorModel.errorMessage,
          statusCode: e.errorModel.status,
        ));
      } on Exception catch (e, st) {
        log('Unexpected error loading home data', error: e, stackTrace: st);
        return const Left(
          UnexpectedFailure(errorMessage: 'Something went wrong'),
        );
      }
    } else {
      try {
        final localUser = await localDataSource.getHomeData();
        return Right(localUser.toEntity());
      } on CacheException catch (e) {
        return Left(CacheFailure(errorMessage: e.errorMessage));
      }
    }
  }
}
