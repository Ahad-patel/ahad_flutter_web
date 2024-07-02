import 'dart:convert';

import 'package:ahad_ayna_interview_project/features/chat/data/models/chat.dart';
import 'package:ahad_ayna_interview_project/features/chat/data/models/room.dart';
import 'package:hive/hive.dart';
import 'package:collection/collection.dart';
import 'package:path_provider/path_provider.dart';

abstract class AppLocalKeys {
  static const String boxName = 'flutter-web';
  static const String roomBox = 'rooms';
  static const String user = 'user';
  static const String userList = 'user-list';
  static const String chats = 'chat';
}

class AppLocalDB extends AppLocalKeys {
  static late Box _box;
  static late Box<Room> roomBox;

  Future<Box<Room>> get getRoomList async =>
      await Hive.openBox<Room>(AppLocalKeys.roomBox);

  // Future<Room?> getRoom(String roomId) async {
  //   var roomList = await getRoomList;
  //   var room = roomList.values.firstWhereOrNull(
  //     (e) => e.id == roomId,
  //   );
  //   return room;
  // }

  // initialize db
  static Future<void> init() async {
    _registerAdapters();
    _box = await Hive.openBox(AppLocalKeys.boxName);
    roomBox = await Hive.openBox<Room>(AppLocalKeys.roomBox);
    print("box initiated");
  }

  static void _registerAdapters() {
    Hive.registerAdapter(RoomAdapter());
    Hive.registerAdapter(ChatAdapter());
  }

  static Future<void> putString(
      {required String key, required String value}) async {
    return await _box.put(key, value);
  }

  static Future<String> getString(String key) async {
    var res = await _box.get(key);
    return res is String ? res : '';
  }

  static Future<void> putBool(
      {required String key, required bool value}) async {
    return await _box.put(key, value);
  }

  static Future<bool> getBool(String key) async {
    var res = await _box.get(key);
    return res is bool ? res : false;
  }

  static Future<void> putList(
      {required String key, required List value}) async {
    return await _box.put(key, value);
  }

  static Future<List> getList(String key) async {
    var res = await _box.get(key);
    return res is List ? res : [];
  }

  static Future<void> putObject(
      {required String key, required Object value}) async {
    return await _box.put(key, value);
  }

  static Future getObject(String key) async {
    var res = await _box.get(key);
    return res;
  }

  static Future<void> putMap(
      {required String key, required Map<String, dynamic> value}) async {
    return await _box.put(key, value);
  }

  static Future<Map<String, dynamic>?> getMap(String key) async {
    var res = await _box.get(key);
    return res is Map<String, dynamic> ? res : null;
  }

  static Future<void> putInt({required String key, required int value}) async {
    return await _box.put(key, value);
  }

  static Future<int> getInt(String key) async {
    var res = await _box.get(key);
    return res is int ? res : 0;
  }

  static Future<void> delete(String key) async {
    return await _box.delete(key);
  }

  static Future<int> deleteAll() async {
    return await _box.clear();
  }

  // close db
  Future<void> close() async {
    await _box.close();
  }
}
