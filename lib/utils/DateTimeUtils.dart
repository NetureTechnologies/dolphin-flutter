library dolphin_flutter;

import 'package:intl/intl.dart';

class DateTimeUtils {
  static String getTodayDateFormattedInternational() {
    String formattedDate = "";
    try {
      var now = new DateTime.now();
      var formatter = new DateFormat('yyyy-MM-dd');
      formattedDate = formatter.format(now);
    } catch (e) {
      throw new Exception("Error - $e");
    }

    return (formattedDate);
  }
  static String getTodayDatetimeFormattedInternational() {
    String formattedDate = "";
    try {
      var now = new DateTime.now();
      var formatter = new DateFormat('yyyy-MM-dd').add_Hms();
      formattedDate = formatter.format(now);
    } catch (e) {
      throw new Exception("Error - $e");
    }

    return (formattedDate);
  }
  static String getTodayDatetimeFormattedBrazil() {
    String formattedDate = "";
    try {
      var now = new DateTime.now();
      var formatter = new DateFormat('dd/MM/yyyy').add_Hms();
      formattedDate = formatter.format(now);
    } catch (e) {
      throw new Exception("Error - $e");
    }

    return (formattedDate);
  }

  // Formatting
  static String uiFormatBrazil(DateTime date) => DateFormat("dd/MM/yyyy").format(date);
  static DateTime apiFormatDateFromBackend(String date) => DateFormat("dd/MM/yyyy").parse(date);
  static DateTime apiFormatDateTimeFromBackend(String date) => DateFormat("dd/MM/yyyy HH:mm:ss").parse(date);
  static String apiFormatDateToBackend(DateTime date) => DateFormat("dd/MM/yyyy").format(date);
  static String apiFormatDateTimeToBackend(DateTime date) => DateFormat("dd/MM/yyyy HH:mm:ss").format(date);
  static String apiFormatInternational(DateTime date) => DateFormat("yyyy-MM-dd").format(date);
  static String apiFormatInternationalWithTime(DateTime date) => DateFormat("yyyy-MM-dd'T'HH:mm:ss'.000Z'").format(date);

  // Reverse
  static String fromBrazilToISOFormat(String brDate) {
    List<String> divided = brDate.split(' ');
    List<String> dateDivided = divided[0].split('/');
    return "${dateDivided[2]}-${dateDivided[1]}-${dateDivided[0]}T${divided.length > 1 ? divided[1] : "00"}:00";
  }

  // Helpers
  static bool isDateInTheFuture(DateTime date) => date.isAfter(DateTime.now());
  static bool isDateInThePast(DateTime date) => date.isBefore(DateTime.now());
}