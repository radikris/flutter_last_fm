import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:last_fm_api/app.dart';

class AppService extends GetxService {
  RxBool isHungarian = true.obs;
  late final GetStorage box;

  @override
  void onInit() {
    super.onInit();
    box = GetStorage();
    isHungarian.value = box.read(App.HUN_KEY) ?? true;
  }

  @override
  void onClose() {}

  void updateLocale() {
    if (isHungarian.value) {
      Get.updateLocale(App.ENLOCALE);
    } else {
      Get.updateLocale(App.HULOCALE);
    }
  }

  void changeLanguage() {
    updateLocale();
    isHungarian.toggle();
    box.write(App.HUN_KEY, isHungarian.value);
  }
}
