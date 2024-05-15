import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

abstract class AppLocalKeys {
  static const String boxName = 'flutter-web';
  static const String users = 'users';
  static const String currentUser = 'currentUser';
  static const String chats = 'chat';
}

class AppLocalDB extends AppLocalKeys {
  static late Box _box;

  // initialize db
  static Future<void> init() async {
    _box = await Hive.openBox(AppLocalKeys.boxName);
    print("box intiated");
  }

  static Future<void> write<T>({required String key, required T value}) async {
    return await _box.put(key, value);
  }

  static Future<T> read<T>(String key) async {
    return await _box.get(key);
  }

  static Future<void> delete(String key) async {
    return await _box.delete(key);
  }

  // close db
  Future<void> close() async {
    await _box.close();
  }
}
