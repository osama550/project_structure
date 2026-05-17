import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_structure/core/router/app_routes.dart';
import 'package:project_structure/core/constants/constant.dart';
import 'package:project_structure/core/di/service_locator.dart';
import 'package:project_structure/features/home/presentation/cubit/home_cubit.dart';
import 'package:project_structure/features/home/presentation/pages/home_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: Constants.initialLocation,
    routes: [
      GoRoute(
        path: AppRoutes.homeView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<HomeCubit>()..getHomeData(),
          child: const HomeScreen(),
        ),
      ),
    ],
  );
}
