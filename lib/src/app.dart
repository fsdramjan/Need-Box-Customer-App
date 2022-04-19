import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'configs/appTheme.dart';
import 'pages/home/bottomAppBar.dart';

 

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.onlyBuilder,
      theme: AppTheme.appTheme,
      home: CustomBottomAppBar(),
    );
  }
}
