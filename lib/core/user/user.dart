import 'dart:convert';

import 'package:uuid/uuid.dart';
import 'package:collection/collection.dart';
import '../config/hive_db.dart';

class User {
  final String? id;
  final String name;
  final String password;

  User({
    this.id,
    this.name = '',
    this.password = '',
  });

  User copyWith({
    String? id,
    String? name,
    String? password,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        password: password ?? this.password,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        password: json["password"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "password": password,
      };

  Future<bool> get isLoggedIn async {
    var user = await getCurrentUser();
    return user != null;
  }

  static Future<void> register(User user) async {
    List<User> userList = await getUserList();

    if (userList.isNotEmpty) {
      var userExists = userList.any((element) => element.name == user.name);
      if (userExists) {
        throw Exception('User Already Exists');
      }
    }
    userList.add(user);
    await putAll(userList);
    return await AppLocalDB.putString(
        key: AppLocalKeys.user, value: user.toJson());
  }

  static Future<bool> login(User user) async {
    List<User> userList = await getUserList();

    User? userFromDb =
        userList.firstWhereOrNull((element) => element.name == user.name);

    if (userFromDb == null) throw Exception('User Does not exists');

    bool passwordMatch = user.password == userFromDb.password;

    if (!passwordMatch) throw Exception('Invalid Password');

    await AppLocalDB.putString(
        key: AppLocalKeys.user, value: userFromDb.toJson());
    return true;
  }

  static Future<User?> getCurrentUser() async {
    var res = await AppLocalDB.getString(AppLocalKeys.user);
    if (res.isNotEmpty) {
      return User.fromJson(res);
    }
    return null;
  }

  static Future<List<User>> getUserList() async {
    var res = await AppLocalDB.getList(AppLocalKeys.userList);
    print("Response $res");
    return res.map((e) => User.fromJson(e)).toList();
  }

  static Future<void> putAll(List<User> userList) async {
    return await AppLocalDB.putList(
        key: AppLocalKeys.userList,
        value: userList.map((e) => e.toJson()).toList());
  }

  static Future<void> logout() async {
    return await AppLocalDB.delete(AppLocalKeys.user);
  }
}
