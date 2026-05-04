import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:project_structure/app/my_app.dart';
import 'package:project_structure/core/config/app_bloc_observer.dart';
import 'package:project_structure/core/databases/cache/hive_config.dart';
import 'package:project_structure/core/di/service_locator.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: "dotenv");
  await setUpServiceLocator();
  await HiveConfig.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await EasyLocalization.ensureInitialized();

  Bloc.observer = const AppBlocObserver();

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en'),
      Locale('ar'),
    ],
    path: "assets/translations",
    child: const MyApp(),
  ));
  FlutterNativeSplash.remove();
}
