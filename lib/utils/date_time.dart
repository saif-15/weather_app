import 'package:intl/intl.dart';

class DateTimeFormat {
  DateTimeFormat._();

  static String toDateString(int timestamp) {
    return DateFormat.yMMMMd('en_US')
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000))
        .toString();
  }

  static String toMString(int timestamp) {
    return DateFormat.yMMMMd('en_US')
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000))
        .toString();
  }

  static String footerDate(int timestamp) {
    return DateFormat.yMd()
        .add_jm()
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000))
        .toString();
  }

  static String to24HoursTimeString(int timestamp) {
    return DateFormat.Hm()
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000))
        .toString();
  }

  static String to12HoursTimeString(int timestamp) {
    return DateFormat.jm()
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000))
        .toString();
  }

  static String toWeekDay(int timestamp) {
    return DateFormat('EEEE')
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000))
        .toString();
  }

  static bool isDay(int timestamp) {
    int hour = int.parse(DateFormat('H')
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000)));
    return hour >= 6 && hour < 18;
  }
}
