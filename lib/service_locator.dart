import 'package:ahad_ayna_interview_project/core/routes/navigation_service.dart';
import 'package:ahad_ayna_interview_project/core/user/user.dart';
import 'package:get_it/get_it.dart';

import 'core/config/shim_db.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // config
  sl.registerLazySingleton(() => AppLocalDB());
  sl.registerLazySingleton(() => User());

  // utils
  sl.registerLazySingleton(() => NavigationService());
}
