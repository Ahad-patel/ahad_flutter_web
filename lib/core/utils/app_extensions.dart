import 'package:jiffy/jiffy.dart';

extension DateFormatExt on DateTime {
  String get formatDate {
    try {
      return Jiffy.parse(toIso8601String()).fromNow();
    } catch (e) {
      return '';
    }
  }
}
