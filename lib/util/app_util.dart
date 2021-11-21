import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class AppUtil {
  AppUtil._();

  static String formatNumber(int value) {
    return NumberFormat.compact().format(value);
  }

  static String formatStringToNumber(String value) {
    return NumberFormat.compact().format(double.tryParse(value));
  }

  static String formatedTime(int seconds) {
    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int min = seconds ~/ 60;
    int sec = seconds % 60;

    String parsedTime = getParsedTime(min.toString()) + ":" + getParsedTime(sec.toString());

    return parsedTime;
  }

  static String publishFormat(String publish) {
    return 'published'.tr + '${publish.split(',').elementAt(0).toString()}';
  }

  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch.';
    }
  }
}
