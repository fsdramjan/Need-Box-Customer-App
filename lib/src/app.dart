import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'configs/appTheme.dart';
import 'controllers/MainController/baseController.dart';
import 'pages/splash/splashPage.dart';

class App extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    wholesaleProductC.getWholesaleProduct();
    appLogoC.getAppLogo();
    sliderListC.getSliderList();
    sliderListC.wholesaleBanner();
    sliderListC.popUpBanner();
    sliderListC.customerPostBanner();
    allProductListC.getAllProduct();
    allCategoryC.getAllCategory();
    specialOfferProductC.getAllSpecialOfferProduct();
    campaignListC.getAllCampaignList();
    brandListC.getAllBrandList();
    shopListC.getAllShopList();
    userProfileDetailsC.getProfileDetails();
    allOrderListC.getAllOrders();
    serviceCategoryC.getAllServiceCategory();
    customerPostListC.getAllCustomerPost();
    districtsListC.getAllDistricts();
    shippingAddressC.getShipAddress();
    chatC.getChatList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.onlyBuilder,
      theme: AppTheme.appTheme,
      home: SplashPage(),
    );
  }
}
