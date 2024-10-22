import 'package:intl/intl.dart';

class DateTimeUtil {
  static const String yyyyDateTime = "yyyy";
  static const String ddMMyyyyDateTime = "dd-MM-yyyy";
  static const String yyyyMMddDateTime = "yyyy-MM-dd";

  String convertDateTimeToString(
      {required DateTime dateTime, String outputFormat = ddMMyyyyDateTime}) {
    return DateFormat(outputFormat).format(dateTime);
  }

  DateTime convertStringToDateTime(
      {required String input, String outputFormat = ddMMyyyyDateTime}) {
    return DateFormat(outputFormat).parse(input);
  }
}
