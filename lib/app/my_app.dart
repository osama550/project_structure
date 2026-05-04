import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_structure/core/config/router/app_router.dart';
import 'package:project_structure/core/config/router/app_routes.dart';
import 'package:project_structure/core/config/theme/app_theme.dart';
import 'package:project_structure/core/config/theme/breakpoints.dart';
import 'package:project_structure/core/constant/constant.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceType = Breakpoints.of(context);
    Constant.initialLocation = AppRoutes.homeView;
    return MediaQuery.withClampedTextScaling(
        maxScaleFactor: 1,
        child: MaterialApp.router(
          theme: AppTheme.theme(deviceType),
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          title: 'project_structure',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ));
  }
}
