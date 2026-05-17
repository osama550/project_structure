import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_structure/core/router/app_router.dart';
import 'package:project_structure/core/router/app_routes.dart';
import 'package:project_structure/core/theme/app_theme.dart';
import 'package:project_structure/core/theme/breakpoints.dart';
import 'package:project_structure/core/constants/constant.dart';

class App extends StatelessWidget {
  const App({super.key});

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
