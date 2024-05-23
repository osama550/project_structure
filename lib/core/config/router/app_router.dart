import 'package:go_router/go_router.dart';
import 'package:project_structure/core/config/router/app_routes.dart';
import 'package:project_structure/features/home/home_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.homeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
