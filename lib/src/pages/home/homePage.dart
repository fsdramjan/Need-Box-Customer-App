// ignore_for_file: unused_field, unused_element, unused_local_variable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/search/productSearchPage.dart';
import 'package:needbox_customer/src/widgets/formField/searchFormField.dart';
import '../../components/category/categoryComponent.dart';
import '../../components/category/serviceCategoryComponent.dart';
import '../../components/product/homeProductComponent.dart';
import '../../components/slider/sliderComponent.dart';
import '../../configs/appColors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with BaseController {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _refresh() {
    _resetList();
    return _getList();
  }

  void _resetList() {
    BaseController().allProductListC.allProductList.clear();
    BaseController().allCategoryC.allCategoryList.clear();
  }

  Future _getList() {
    BaseController().allCategoryC.getAllCategory();
    BaseController().allProductListC.getAllProduct();

    return BaseController().appLogoC.getAppLogo();
  }

  final keyRefresh = GlobalKey<RefreshIndicatorState>();
  //

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    allCategoryC.getAllCategory();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          50,
        ),
        child: SafeArea(
          child: Container(
            color: white,
            child: Center(
              child: Row(
                children: [
                  // Padding(
                  //   padding: EdgeInsets.only(left: 5),
                  //   child: GestureDetector(
                  //     onTap: _iconTapped,
                  //     child: AnimatedIcon(
                  //       icon: AnimatedIcons.menu_close,
                  //       progress: _animationController,
                  //       size: 30,
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Image.asset(
                      'assets/images/applogo.png',
                    ),
                  ),
                  Expanded(
                    child: searchFormField(onTap: () {
                      Get.to(ProductSearchPage());
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () => BaseController().allProductListC.allProductList.isEmpty
            ? Center(
                child: LoadingAnimation(),
              )
            : SafeArea(
                child: RefreshIndicator(
                  color: orangeO50,
                  key: keyRefresh,
                  onRefresh: _refresh,
                  child: ListView(
                    physics: bounchephysics,
                    children: [
                      sizeH10,
                      CarosolSliderComponent(),
                      sizeH20,
                      ServiceComponent(),
                      Padding(
                        padding: paddingH10,
                        child: Column(
                          children: [
                            sizeH10,
                            CategoryComponent(),
                            sizeH10,
                            HomeProductComponent(),
                            sizeH40,
                            sizeH40,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
