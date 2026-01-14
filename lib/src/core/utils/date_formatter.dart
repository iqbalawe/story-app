import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateFormatter {
  static String formatTimeAgo(String dateString, String languageCode) {
    try {
      final DateTime date = DateTime.parse(dateString);
      return timeago.format(date, locale: languageCode);
    } catch (e) {
      return '-';
    }
  }

  static String formatDate(String dateString, String languageCode) {
    try {
      final DateTime date = DateTime.parse(dateString).toLocal();

      String pattern;
      String localeStr;

      if (languageCode == 'en') {
        pattern = 'EEEE, dd MMM yyyy hh:mm a';
        localeStr = 'en_US';
      } else {
        pattern = 'EEEE, dd MMM yyyy HH:mm';
        localeStr = 'id_ID';
      }

      final DateFormat formatter = DateFormat(pattern, localeStr);
      return formatter.format(date);
    } catch (e) {
      return '-';
    }
  }
}
