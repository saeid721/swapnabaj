import 'package:intl/intl.dart';

class DateTimeFormatter {
  /// [to view only || converting from database format]
  static DateFormat showDateOnly = DateFormat("dd/MM/yyyy");
  static DateFormat showMonthDayOnly = DateFormat("MM/dd/yyyy");
  static DateFormat showDateOnlyYear = DateFormat("yyyy-MM-dd");
  static DateFormat showTimeOnly = DateFormat("hh:mm a");
  static DateFormat showDateTime = DateFormat("dd/MM/yyyy hh:mm a");
  static DateFormat showDateTimeWithMonth =
      DateFormat("dd MMM yyyy hh:mm a"); // e.g: 12 Sep 2023 12:30 PM
  static DateFormat parsedTime = DateFormat.yMd();

  //
  static DateFormat dbFormatDateOnly = DateFormat("yyyy-MM-dd");
  static DateFormat dbFormatDateTime = DateFormat("yyyy-MM-dd hh:mm");
}
