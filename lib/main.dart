import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:needbox_customer/src/controllers/hive/hiveController.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await initAppConfig();

  runApp(App());
}

Future<void> initAppConfig() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.put(HiveController(), permanent: true).initDatabase();
}
