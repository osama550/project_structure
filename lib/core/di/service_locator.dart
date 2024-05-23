import 'package:get_it/get_it.dart';
import 'package:project_structure/core/api/api_service.dart';

import 'auth_dependencies.dart';

GetIt sl = GetIt.instance;

Future<void> setUpServiceLocator() async {
  //* Register the API service as a singleton.
  sl.registerSingleton(ApiService());

  //* Register the dependencies related to authentication.
  registerAuthDepndencies();
}
