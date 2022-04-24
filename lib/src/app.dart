import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:needbox_customer/src/splash/splashPage.dart';
import 'configs/appTheme.dart';
import 'controllers/MainController/baseController.dart';

class App extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    appLogoC.getAppLogo();
    sliderListC.getSliderList();
    allProductListC.getAllProduct();
    allCategoryC.getAllCategory();
    specialOfferProductC.getAllSpecialOfferProduct();
    campaignListC.getAllCampaignList();
    brandListC.getAllBrandList();
    shopListC.getAllShopList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.onlyBuilder,
      theme: AppTheme.appTheme,
      home: SplashPage(),
    );
  }
}
