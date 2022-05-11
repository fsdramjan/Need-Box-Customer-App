import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/products/productDetailsPage.dart';
import 'package:needbox_customer/src/widgets/cardWidget/customGridProducts.dart';

import '../../Widgets/button/customBackButton.dart';
import '../../widgets/textWidget/kText.dart';

class SpecialOfferProductPage extends StatelessWidget with BaseController {
  Future<void> _refresh() {
    _resetList();
    return _getList();
  }

  void _resetList() {
    specialOfferProductC.specialOfferProductList.clear();
  }

  Future _getList() {
    specialOfferProductC.getAllSpecialOfferProduct();
    return appLogoC.getAppLogo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'Special Offer',
          fontSize: 16,
        ),
      ),
      body: Obx(
        () => specialOfferProductC.isLoading.value == true
            ? Center(child: LoadingAnimation())
            : specialOfferProductC.specialOfferProductList.length == 0
                ? Center(child: EmptyAnimation())
                : Padding(
                    padding: paddingH10V20,
                    child: RefreshIndicator(
                      onRefresh: _refresh,
                      child: GridView.builder(
                          physics: bounchephysics,
                          shrinkWrap: true,
                          primary: false,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: specialOfferProductC
                              .specialOfferProductList.length,
                          itemBuilder: (c, i) {
                            final item =
                                specialOfferProductC.specialOfferProductList[i];

                            return CustomGridCardWidget(
                              onTap: (() => Get.to(
                                    ProductDetailsPage(
                                      id: item.id,
                                      proName: item.productname,
                                      image:
                                          'public/uploads/category/1598528183-womenfashion.png',
                                    ),
                                  )),
                              imageUrl:
                                  'public/uploads/category/1598528183-womenfashion.png',
                              productname: item.productname.toString(),
                              discount: item.productdiscount,
                              disprice: item.productnewprice,
                              oldprice: item.productoldprice,
                            );
                          }),
                    ),
                  ),
      ),
    );
  }
}
