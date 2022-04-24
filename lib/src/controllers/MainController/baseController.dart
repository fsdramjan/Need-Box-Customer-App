import 'package:get/get.dart';
import 'package:needbox_customer/src/controllers/appLogo/appLogoController.dart';
import 'package:needbox_customer/src/controllers/brand/brandProductListController.dart';
import 'package:needbox_customer/src/controllers/brand/brandsListController.dart';
import 'package:needbox_customer/src/controllers/campaign/campaignListController.dart';
import 'package:needbox_customer/src/controllers/category/categoryListController.dart';
import 'package:needbox_customer/src/controllers/category/categoryProductController.dart';
import 'package:needbox_customer/src/controllers/products/allProductsController.dart';
import 'package:needbox_customer/src/controllers/products/productDetailsController.dart';
import 'package:needbox_customer/src/controllers/products/specialOfferProductController.dart';
import 'package:needbox_customer/src/controllers/shop/shopDetailsController.dart';
import 'package:needbox_customer/src/controllers/shop/shopListController.dart';
import 'package:needbox_customer/src/controllers/slider/sliderController.dart';

class BaseController {
  final appLogoC = Get.put(AppLogoController(), permanent: true);
  final sliderListC = Get.put(SliderController(), permanent: true);
  final allProductListC = Get.put(AllProductsController(), permanent: true);
  final productDetailsC = Get.put(ProductDetailsController(), permanent: true);
  final allCategoryC = Get.put(CategoryListController(), permanent: true);
  final categoryProductC = Get.put(CategoryProductsController(), permanent: true);
  final specialOfferProductC =
      Get.put(SpecialOfferProductsController(), permanent: true);
  final campaignListC = Get.put(CampaignListController(), permanent: true);
  final brandListC = Get.put(BrandsListController(), permanent: true);
  final brandProductListC = Get.put(BrandsProductListController(), permanent: true);
  final shopListC = Get.put(ShopListController(), permanent: true);
  final shopDetailsC = Get.put(ShopDetailsController(), permanent: true);
}
