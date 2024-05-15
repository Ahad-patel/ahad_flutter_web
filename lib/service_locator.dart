import 'package:ahad_ayna_interview_project/core/config/hive_db.dart';
import 'package:ahad_ayna_interview_project/core/user/user.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // config
  sl.registerLazySingleton(() => AppLocalDB());
  sl.registerLazySingleton(() => User());
}
