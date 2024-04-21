class DateUtils {
  static String DateTimeToString({
    required DateTime dateTime,
  }) {
    return '${dateTime.year}-${padInteger(number: dateTime.month)}-${padInteger(number: dateTime.day)} ${padInteger(number: dateTime.hour)}:00';
  }

  static String padInteger({
    required int number,
  }) {
    return number.toString().padLeft(2, '0');
  }
}
