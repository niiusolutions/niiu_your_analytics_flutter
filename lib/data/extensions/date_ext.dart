import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59);
  }

  String formatDateTimeFromUtc() {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(this);
  }

  int get dayOfYear {
    return difference(DateTime(year, 1, 1)).inDays;
  }
}
