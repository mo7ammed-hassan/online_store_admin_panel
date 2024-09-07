import 'package:intl/intl.dart';

String formatDate(String time) {
  return DateFormat("yyyy-MM-dd '-' H:mm a").format(
    DateTime.parse(time),
  );
}
