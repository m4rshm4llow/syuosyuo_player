import 'package:intl/intl.dart';

extension StringX on String {
  String formatDate() {
    final date = DateTime.parse(this);
    final formatter = DateFormat('yyyy年MM月dd日');
    return formatter.format(date);
  }

  double toSeconds() {
    List<String> parts = split(':');
    if (parts.length != 3) {
      throw FormatException('Invalid time format. Expected HH:MM:SS');
    }

    double hours = double.parse(parts[0]);
    double minutes = double.parse(parts[1]);
    double seconds = double.parse(parts[2]);

    return hours * 3600 + minutes * 60 + seconds;
  }
}
