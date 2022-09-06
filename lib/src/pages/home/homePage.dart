// ignore_for_file: unused_field, unused_element, unused_local_variable, unnecessary_null_comparison, unnecessary_statements, must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/components/home/brands/brandsComponents.dart';
import 'package:needbox_customer/src/components/home/campaign/campaignComponents.dart';
import 'package:needbox_customer/src/components/home/customerPost/customerPostComponent.dart';
import 'package:needbox_customer/src/components/home/product/recomandedProductComponent.dart';
import 'package:needbox_customer/src/components/home/product/wholesaleProductComponent.dart';
import 'package:needbox_customer/src/components/home/service/serviceComponent.dart';
import 'package:needbox_customer/src/components/home/slider/customerPostSliderComponent.dart';
import 'package:needbox_customer/src/components/home/slider/popUpSliderComponent.dart';
import 'package:needbox_customer/src/components/home/slider/serviceSliderComponent.dart';
import 'package:needbox_customer/src/components/home/slider/wholesaleSliderComponent.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/search/productSearchPage.dart';
import 'package:needbox_customer/src/widgets/dialog/homePopupDialog.dart';
import 'package:needbox_customer/src/widgets/formField/searchFormField.dart';
import '../../components/home/product/homeProductComponent.dart';
import '../../components/home/slider/sliderComponent.dart';
import '../../configs/appColors.dart';
import '../../widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';

class HomePage extends StatefulWidget {
  final searchTextC = TextEditingController();
  bool? isHidePopUps;

  HomePage({super.key, required this.isHidePopUps});

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

  @override
  void initState() {
    sliderListC.popUpBanner();
    if (widget.isHidePopUps == true) {
      print(widget.isHidePopUps);
    }
    print(sliderListC.popUpSliderList.length);
    if (widget.isHidePopUps == false) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        print(widget.isHidePopUps);

        Future.delayed(Duration(seconds: 1)).whenComplete(() {
          if (sliderListC.popUpSliderList.isEmpty) {
          } else {
            showDialog<void>(
              context: context,
              // barrierDismissible: false,
              builder: (BuildContext context) {
                return homePopupDialog(context, widget.isHidePopUps);
              },
            );
          }
        });
      });
    }

    super.initState();
  }
  //

  // ScrollController _scrollController1 = ScrollController();
  // ScrollController _scrollController2 = ScrollController();
  // ScrollController _scrollController3 = ScrollController();

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     double minScrollExtent1 = _scrollController1.position.minScrollExtent;
  //     double maxScrollExtent1 = _scrollController1.position.maxScrollExtent;
  //     double minScrollExtent2 = _scrollController2.position.minScrollExtent;
  //     double maxScrollExtent2 = _scrollController2.position.maxScrollExtent;
  //     double minScrollExtent3 = _scrollController3.position.minScrollExtent;
  //     double maxScrollExtent3 = _scrollController3.position.maxScrollExtent;
  //     //
  //     animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 35,
  //         _scrollController1);
  //     animateToMaxMin(maxScrollExtent2, minScrollExtent2, maxScrollExtent2, 30,
  //         _scrollController2);
  //     animateToMaxMin(maxScrollExtent3, minScrollExtent3, maxScrollExtent3, 20,
  //         _scrollController3);
  //   });
  // }

  // animateToMaxMin(double max, double min, double direction, int seconds,
  //     ScrollController scrollController) {
  //   scrollController
  //       .animateTo(direction,
  //           duration: Duration(seconds: seconds), curve: Curves.linear)
  //       .then((value) {
  //     direction = direction == max ? min : max;
  //     animateToMaxMin(max, min, direction, seconds, scrollController);
  //   });
  // }

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
                  physics: bounchephysics,
                  children: [
                    sizeH10,
                    CarosolSliderComponent(),
                    // sizeH20,
                    // ServiceComponent(),
                    Padding(
                      padding: paddingH10,
                      child: Column(
                        children: [
                          sizeH10,
                          // CategoryComponent(),
                          // sizeH10,
                          HomeProductComponent(),
                          sizeH10,
                          ServiceSliderComponent(),
                          sizeH10,
                          ServicesComponent(),
                          sizeH10,
                          WholesaleSliderComponent(),
                          sizeH10,
                          WholesaleComponent(),
                          sizeH10,
                          CustomerPostSliderComponent(),
                          sizeH10,
                          CustomerPostComponent(),
                          sizeH10,
                          CampaignComponents(),
                          sizeH10,
                          BrandsComponents(),
                          sizeH10,
                          RecomandedProductComponent(),
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
