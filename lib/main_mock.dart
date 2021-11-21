import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:last_fm_api/app.dart';
import 'package:flavor/flavor.dart';

void main() async {
  Flavor.create(
    Environment.beta, //mock
  );

  await GetStorage.init();
  runApp(App());
}
