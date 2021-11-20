import 'package:get/get.dart';
import 'package:last_fm_api/routes/app_pages.dart';

class Navigation {
  Navigation._();

  static void popAnyTimes(int times) {
    for (var i = 0; i < times; i++) {
      Get.back();
    }
  }

  static void popBack() {
    Get.back();
  }

  static void toDetail() {
    Get.toNamed(
      Routes.DETAIL,
    );
  }
}
