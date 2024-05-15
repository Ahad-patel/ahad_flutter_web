import '../config/hive_db.dart';

class User {
  final String name;
  final String password;
  bool isLoggedIn = false;

  User({
    this.name = '',
    this.password = '',
  });

  Future<void> init() async {
    isLoggedIn = ((await get()) != null);
    print("User is loggedin $isLoggedIn");
  }
  // Future<bool> get isLoggedIn async => ((await get()) != null);

  static Future<void> save(User user) async {
    List<User> userList = (await AppLocalDB.read(AppLocalKeys.users)) ?? [];
    userList.add(user);
    await AppLocalDB.write(key: AppLocalKeys.users, value: userList);

    return await AppLocalDB.write(key: AppLocalKeys.currentUser, value: user);
  }

  static Future<User?> get() async {
    return await AppLocalDB.read(AppLocalKeys.currentUser);
  }

  static Future<void> logout() async {
    return await AppLocalDB.delete(AppLocalKeys.currentUser);
  }
}
