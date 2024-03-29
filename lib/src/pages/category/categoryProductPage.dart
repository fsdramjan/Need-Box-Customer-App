import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/products/productDetailsPage.dart';
import 'package:needbox_customer/src/pages/products/wholesaleProductPage.dart';
import 'package:needbox_customer/src/widgets/cardWidget/customGridProducts.dart';

import '../../Widgets/button/customBackButton.dart';
import '../../widgets/textWidget/kText.dart';

class CategoryProductPage extends StatefulWidget  {
  final int? id;
  final String? categoryName;

  CategoryProductPage({
    required this.id,
    required this.categoryName,
  });

  @override
  State<CategoryProductPage> createState() => _CategoryProductPageState();
}

class _CategoryProductPageState extends State<CategoryProductPage>
    with BaseController {
  Future<void> _refresh() {
    _resetList();
    return _getList();
  }

  void _resetList() {
    categoryProductC.categoryProductList.clear();
  }

  Future _getList() {
    categoryProductC.getAllCategoryProduct(id: widget.id, categoryName: widget.categoryName);
    return appLogoC.getAppLogo();
  }

  @override
  void initState() { 
       categoryProductC.getAllCategoryProduct(
        categoryName: widget.categoryName, id: widget.id);
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
 
    print(widget.id);
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: widget.categoryName.toString(),
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
                      triggerMode: RefreshIndicatorTriggerMode.anywhere,
                      color: orangeO50,
                      child: GridView.builder(
                          shrinkWrap: true,
                          primary: false,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.70,
                          ),
                          itemCount:
                              categoryProductC.categoryProductList.length,
                          itemBuilder: (c, i) {
                            final item =
                                categoryProductC.categoryProductList[i];

                            return CustomGridCardWidget(
                              onTap: (() => item.productnewprice == null
                                  ? Get.to(WholesaleProductPage())
                                  : Get.to(
                                      ProductDetailsPage(
                                        id: item.id,
                                        proName: item.productname,
                                        image: item.proImage!.image.toString(),
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
