// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/components/appLogo/appLogoComponent.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/home/bottomAppBar.dart';
import 'package:needbox_customer/src/pages/loginSignup/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget with BaseController {
  String? finalToken;
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(
        Duration(seconds: 3),
        () => Get.offAll(
          widget.finalToken == null || widget.finalToken!.isEmpty
              ? LoginPage()
              : CustomBottomAppBar(),
        ),
      );
    });
    super.initState();
  }

  Future getValidationData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString('accessToken');

    setState(() {
      widget.finalToken = obtainedToken;
     

      print('Token: ${widget.finalToken}');
     
    });
  }

  @override
  Widget build(BuildContext context) {
 
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
