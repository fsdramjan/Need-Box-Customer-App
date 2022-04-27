import 'package:get/get.dart';
import 'package:needbox_customer/src/controllers/appLogo/appLogoController.dart';
import 'package:needbox_customer/src/controllers/auth/loginController.dart';
import 'package:needbox_customer/src/controllers/auth/registerController.dart';
import 'package:needbox_customer/src/controllers/brand/brandProductListController.dart';
import 'package:needbox_customer/src/controllers/brand/brandsListController.dart';
import 'package:needbox_customer/src/controllers/campaign/campaignListController.dart';
import 'package:needbox_customer/src/controllers/category/categoryListController.dart';
import 'package:needbox_customer/src/controllers/category/categoryProductController.dart';
import 'package:needbox_customer/src/controllers/favoirteProduct/favoriteProductController.dart';
import 'package:needbox_customer/src/controllers/orders/orderListController.dart';
import 'package:needbox_customer/src/controllers/products/allProductsController.dart';
import 'package:needbox_customer/src/controllers/products/productDetailsController.dart';
import 'package:needbox_customer/src/controllers/products/specialOfferProductController.dart';
import 'package:needbox_customer/src/controllers/shop/shopDetailsController.dart';
import 'package:needbox_customer/src/controllers/shop/shopListController.dart';
import 'package:needbox_customer/src/controllers/shop/shopProductController.dart';
import 'package:needbox_customer/src/controllers/slider/sliderController.dart';
import 'package:needbox_customer/src/controllers/userAccount/editProfileController.dart';
import 'package:needbox_customer/src/controllers/userAccount/userProfileDetailsController.dart';


class BaseController { 
  final appLogoC = Get.put(AppLogoController());
  final sliderListC = Get.put(SliderController());
  final allProductListC = Get.put(AllProductsController());
  final productDetailsC = Get.put(ProductDetailsController());
  final allCategoryC = Get.put(CategoryListController());
  final categoryProductC = Get.put(CategoryProductsController());
  final specialOfferProductC = Get.put(SpecialOfferProductsController());
  final campaignListC = Get.put(CampaignListController());
  final brandListC = Get.put(BrandsListController());
  final brandProductListC = Get.put(BrandsProductListController());
  final shopListC = Get.put(ShopListController()); 
  final shopDetailsC = Get.put(ShopDetailsController());
  final shopProductC = Get.put(ShopProductController());
  final userRegisterC = Get.put(RegisterController());
  final userLoginC = Get.put(LoginController());
  final userProfileDetailsC = Get.put(UserProfileDetailsController());
  final userProfileUpdateC = Get.put(EditProfileController());
  final favoriteProductC = Get.put(FavoriteProductController());
  final allOrderListC = Get.put(OrderListController());



}
