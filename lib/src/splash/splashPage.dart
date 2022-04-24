import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/components/appLogo/appLogoComponent.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/home/bottomAppBar.dart';

class SplashPage extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3))
        .whenComplete(() => Get.offAll(CustomBottomAppBar()));
    return Scaffold(
      body: Center(
        child: AppLogoComponent(
          height: Get.height,
          width: Get.width,
        ),
      ),
    );
  }
}
