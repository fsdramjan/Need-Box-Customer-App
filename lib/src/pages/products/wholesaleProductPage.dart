import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/products/wholesaleProductDetailsPage.dart';
import 'package:needbox_customer/src/widgets/cardWidget/customGridProducts.dart';

import '../../Widgets/button/customBackButton.dart';
import '../../widgets/textWidget/kText.dart';

class WholesaleProductPage extends StatelessWidget with BaseController {
  Future<void> _refresh() {
    _resetList();
    return _getList();
  }

  void _resetList() {
    wholesaleProductC.wholeSaleProductList.clear();
  }

  Future _getList() {
    wholesaleProductC.getWholesaleProduct();
    return appLogoC.getAppLogo();
  }

  @override
  Widget build(BuildContext context) {
    wholesaleProductC.getWholesaleProduct();

    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'Wholesale Products',
          fontSize: 16,
        ),
      ),
      body: Obx(
        () => wholesaleProductC.isLoading.value == true
            ? Center(child: LoadingAnimation())
            : wholesaleProductC.wholeSaleProductList.length == 0
                ? Center(child: EmptyAnimation())
                : Padding(
                    padding: paddingH10V10,
                    child: RefreshIndicator(
                      onRefresh: _refresh,
                      triggerMode: RefreshIndicatorTriggerMode.anywhere,
                      color: orangeO50,
                      child: GridView.builder(
                          physics: bounchephysics,
                          shrinkWrap: true,
                          primary: false,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                          ),
                          itemCount:
                              wholesaleProductC.wholeSaleProductList.length,
                          itemBuilder: (c, i) {
                            final item =
                                wholesaleProductC.wholeSaleProductList[i];

                            return CustomGridCardWidget(
                              onTap: (() => Get.to(
                                    WholesaleProductDetailsPage(
                                      id: item.id,
                                      proName: item.productname,
                                      image: item.proImage!.image.toString(),
                                      productPricing: item.productprices,
                                    ),
                                  )),
                              imageUrl: item.proImage!.image,
                              productname: item.productname.toString(),
                              discount: null,
                              disprice: item.productprice!.price,
                              oldprice: null,
                            );
                          }),
                    ),
                  ),
      ),
    );
  }
}
