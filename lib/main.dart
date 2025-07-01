import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_structure/app/my_app.dart';
import 'package:project_structure/core/config/app_bloc_observer.dart';
import 'package:project_structure/core/databases/cache/hive_config.dart';
import 'package:project_structure/core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServiceLocator();
  await HiveConfig.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await EasyLocalization.ensureInitialized();

  Bloc.observer = const AppBlocObserver();

  await ScreenUtil.ensureScreenSize();
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en'),
      Locale('ar'),
    ],
    path: "assets/translations",
    child: const MyApp(),
  ));
}
