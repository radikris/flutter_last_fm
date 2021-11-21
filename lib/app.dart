import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:last_fm_api/routes/app_bindings.dart';
import 'package:last_fm_api/routes/app_pages.dart';
import 'package:last_fm_api/theme/app_theme.dart';

import 'theme/translations.dart';

class App extends StatelessWidget {
  static const HUN_KEY = "ISHUN";
  static const HULOCALE = Locale('hu', 'HU');
  static const ENLOCALE = Locale('en', 'US');
  App({Key? key}) : super(key: key) {
    final box = GetStorage();
    final isHungarian = box.read(HUN_KEY) ?? true;
    if (isHungarian) {
      locale = HULOCALE;
    } else {
      locale = ENLOCALE;
    }
  }

  late Locale locale;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'app_title'.tr,
        translations: Translation(),
        locale: locale,
        initialRoute: AppPages.INITIAL,
        theme: AppTheme.themeData,
        getPages: AppPages.routes,
        initialBinding: AppBindings(),
      ),
    );
  }
}
