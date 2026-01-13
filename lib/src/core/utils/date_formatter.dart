import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateFormatter {
  static String formatTimeAgo(String dateString) {
    try {
      final DateTime date = DateTime.parse(dateString);
      return timeago.format(date, locale: 'id');
    } catch (e) {
      return '-';
    }
  }

  static String formatDate(String dateString) {
    try {
      final DateTime date = DateTime.parse(dateString).toLocal();
      final DateFormat formatter = DateFormat('EEEE, dd MMM yyyy', 'id_ID');
      return formatter.format(date);
    } catch (e) {
      return '-';
    }
  }
}
