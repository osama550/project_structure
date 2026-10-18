import 'package:hive_ce/hive_ce.dart';
import 'package:project_structure/core/errors/exceptions.dart';
import 'package:project_structure/features/home/data/models/home_model.dart';

class HomeLocalDataSource {
  final Box<HomeModel> box;
  static const String boxName = 'homeBox';
  static const String _key = 'homeData';

  HomeLocalDataSource({required this.box});

  Future<HomeModel> getHomeData() async {
    final HomeModel? homeData;
    try {
      homeData = box.get(_key);
    } catch (e) {
      throw CacheException(
        errorMessage: 'Failed to retrieve home data: ${e.toString()}',
      );
    }
    if (homeData == null) {
      throw CacheException(errorMessage: 'No cached home data available');
    }
    return homeData;
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
