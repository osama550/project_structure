import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:project_structure/hive_registrar.g.dart';

/// Initialises Hive and registers all generated adapters. Feature boxes are
/// opened by each feature's own dependency registration.
class HiveConfig {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapters();
  }
}
