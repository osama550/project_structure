import 'package:dartz/dartz.dart';
import 'package:project_structure/core/connection/network_info.dart';
import 'package:project_structure/core/errors/exceptions.dart';
import 'package:project_structure/core/errors/failure.dart';
import 'package:project_structure/features/home/data/datasources/home_local_data_source.dart';
import 'package:project_structure/features/home/data/datasources/home_remote_data_source.dart';
import 'package:project_structure/features/home/data/models/home_model.dart';
import 'package:project_structure/features/home/domain/repositories/home_repos.dart';

class HomeReposImpl implements HomeRepos {
  final NetworkInfo networkInfo;
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeReposImpl(this.networkInfo, this.remoteDataSource, this.localDataSource);
  @override
  Future<Either<Failure, HomeModel>> getHomeData() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteHome = await remoteDataSource.getHomeData();
        localDataSource.saveHomeData(remoteHome);
        return Right(remoteHome);
      } on ServerException catch (e) {
        return Left(Failure(errorMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localUser = await localDataSource.getHomeData();
        return Right(localUser);
      } on CacheException catch (e) {
        return Left(Failure(errorMessage: e.errorMessage));
      }
    }
  }
}
