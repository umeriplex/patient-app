// Date to June 23, 2023 12:00 PM Format
import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat.yMMMMd().add_jm().format(date);
}