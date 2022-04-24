import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/shop/shopDetailsPage.dart';
import 'package:needbox_customer/src/widgets/button/customBackButton.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

import '../../Widgets/cardWidget/customCardWidget.dart';
import '../../animations/loadingAnimation.dart';
import '../../configs/appUtils.dart';

import '../../widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';

class ShopListPage extends StatelessWidget with BaseController {
  Future<void> _refresh() {
    _resetList();
    return _getList();
  }

  void _resetList() {
    shopListC.shopList.clear();
  }

  Future _getList() {
    shopListC.getAllShopList();
    return appLogoC.getAppLogo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'All Shops',
          fontSize: 16,
        ),
      ),
      body: Obx(
        () => shopListC.isLoading.value == true
            ? LoadingAnimation()
            : shopListC.shopList.isEmpty
                ? EmptyAnimation()
                : Padding(
                    padding: paddingH10,
                    child: RefreshIndicator(
                      onRefresh: _refresh,
                      child: GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                        ),
                        itemCount: shopListC.shopList.length,
                        itemBuilder: (context, index) {
                          final item = shopListC.shopList[index];

                          return GestureDetector(
                            onTap: () => Get.to(
                              ShopDetailsPage(
                                id: item.id,
                                shopName: item.shopname,
                              ),
                            ),
                            child: CustomCardWidget(
                              child: Container(
                                width: 140,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CachedNetworkImageWidget(
                                      imageUrl: item.shoplogo.toString(),
                                      width: 110,
                                      height: 90,
                                      fit: BoxFit.cover,
                                    ),
                                    sizeH10,
                                    Text(
                                      item.shopname.toString(),
                                      softWrap: true,
                                      // "TV & Home Appliances$index",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
      ),
    );
  }
}
