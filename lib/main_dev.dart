import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flavor/flavor.dart';

import 'app.dart';

void main() async {
  Flavor.create(
    Environment.dev, //impl
  );

  await GetStorage.init();
  runApp(App());
}
