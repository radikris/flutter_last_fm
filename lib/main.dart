import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:last_fm_api/routes/app_bindings.dart';
import 'package:last_fm_api/routes/app_pages.dart';
import 'package:last_fm_api/theme/app_theme.dart';
import 'package:last_fm_api/theme/translations.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'app_title'.tr,
        translations: Translation(),
        locale: Locale('hu', 'HU'),
        initialRoute: AppPages.INITIAL,
        theme: AppTheme.themeData,
        getPages: AppPages.routes,
        initialBinding: AppBindings(),
      ),
    ),
  );
}
