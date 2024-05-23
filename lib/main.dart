import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_structure/app/my_app.dart';
import 'package:project_structure/core/cache/app_secure_storage.dart';
import 'package:project_structure/core/config/app_bloc_observer.dart';
import 'package:project_structure/core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = const AppBlocObserver();
  await setUpServiceLocator();
  await AppSecureStorage.instance.getToken();
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
