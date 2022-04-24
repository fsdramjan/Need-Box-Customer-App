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

class CategoryProductPage extends StatelessWidget with BaseController {
  final int? id;
  final String? categoryName;

  CategoryProductPage({
    required this.id,
    required this.categoryName,
  });

  Future<void> _refresh() {
    _resetList();
    return _getList();
  }

  void _resetList() {
    categoryProductC.categoryProductList.clear();
  }

  Future _getList() {
    categoryProductC.getAllCategoryProduct(id: id, categoryName: categoryName);
    return appLogoC.getAppLogo();
  }

  @override
  Widget build(BuildContext context) {
    categoryProductC.getAllCategoryProduct(categoryName: categoryName, id: id);
    print(id);
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: categoryName.toString(),
          fontSize: 16,
        ),
      ),
      body: Obx(
        () => categoryProductC.isLoading.value == true
            ? Center(child: LoadingAnimation())
            : categoryProductC.categoryProductList.length == 0
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
                            childAspectRatio: 0.55,
                          ),
                          itemCount:
                              categoryProductC.categoryProductList.length,
                          itemBuilder: (c, i) {
                            final item =
                                categoryProductC.categoryProductList[i];

                            return CustomGridCardWidget(
                              onTap: (() => Get.to(
                                    ProductDetailsPage(
                                      id: item.id,
                                      proName: item.productname,
                                    ),
                                  )),
                              imageUrl: item.proImage!.image,
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
