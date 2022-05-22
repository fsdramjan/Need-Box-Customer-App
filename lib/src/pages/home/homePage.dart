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
  final searchTextC = TextEditingController();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with BaseController {
  Future<void> _refresh() {
    _resetList();
    return _getList();
  }

  void _resetList() {
    BaseController().allProductListC.allProductList.clear();
    BaseController().sliderListC.sliderList.clear();
    BaseController().allCategoryC.allCategoryList.clear();
  }

  Future _getList() {
    BaseController().allCategoryC.getAllCategory();
    BaseController().allProductListC.getAllProduct();
    BaseController().sliderListC.getSliderList();

    return BaseController().appLogoC.getAppLogo();
  }

  //

  @override
  Widget build(BuildContext context) {
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Image.asset(
                      'assets/images/applogo.png',
                    ),
                  ),
                  Expanded(
                    child: searchFormField(
                      onTap: () {
                        Get.to(ProductSearchPage());
                      },
                      controller: widget.searchTextC,
                    ),
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
            : RefreshIndicator(
                color: orangeO50,
                onRefresh: _refresh,
                child: ListView(
                  shrinkWrap: true,
                  primary: false,
                  // physics: bounchephysics,
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
    );
  }
}
