import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_structure/features/home/data/models/home_model.dart';
import 'package:project_structure/features/home/data/models/locale.dart';

class HiveConfig {
  static Future<void> init() async {
    // Initialize Hive for Flutter
    await Hive.initFlutter();

    // Register Hive adapters for models
    Hive.registerAdapter(HomeModelAdapter());
    Hive.registerAdapter(LocaleAdapter());

    // Open Hive boxes for storing data
    await Hive.openBox<HomeModel>('homeBox');
  }
}
