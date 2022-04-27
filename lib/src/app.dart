import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'configs/appTheme.dart';
import 'controllers/MainController/baseController.dart';
import 'pages/splash/splashPage.dart';

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
    userProfileDetailsC.getProfileDetails();
    allOrderListC.getAllOrders();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.onlyBuilder,
      theme: AppTheme.appTheme,
      home: SplashPage(),
    );
  }
}
