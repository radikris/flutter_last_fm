import 'dart:ffi';

import 'package:intl/intl.dart';

class AppUtil {
  AppUtil._();

  static String formatNumber(int value) {
    return NumberFormat.compact().format(value);
  }

  static String formatStringToNumber(String value) {
    return NumberFormat.compact().format(double.tryParse(value));
  }
}
