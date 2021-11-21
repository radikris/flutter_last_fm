import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:last_fm_api/app.dart';
import 'package:last_fm_api/routes/app_bindings.dart';
import 'package:last_fm_api/routes/app_pages.dart';
import 'package:last_fm_api/theme/app_theme.dart';
import 'package:last_fm_api/theme/translations.dart';
import 'package:flavor/flavor.dart';

void main() async {
  Flavor.create(
    Environment.beta, //mock
  );

  await GetStorage.init();
  runApp(App());
}
