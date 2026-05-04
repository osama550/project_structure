import 'package:hive_ce/hive_ce.dart';
import 'package:project_structure/core/errors/exceptions.dart';
import 'package:project_structure/features/home/data/models/home_model.dart';

class HomeLocalDataSource {
  final Box<HomeModel> box;
  static const String _key = 'homeData';

  HomeLocalDataSource({required this.box});

  Future<HomeModel> getHomeData() async {
    try {
      final homeData = box.get(_key);
      if (homeData != null) {
        return homeData;
      } else {
        throw CacheException(errorMessage: "No Internet Connection");
      }
    } catch (e) {
      throw CacheException(
        errorMessage: 'Failed to retrieve home data: ${e.toString()}',
      );
    }
  }

  Future<void> saveHomeData(HomeModel model) async {
    try {
      await box.put(_key, model);
    } catch (e) {
      throw CacheException(
        errorMessage: 'Failed to cache home data: ${e.toString()}',
      );
    }
  }
}
