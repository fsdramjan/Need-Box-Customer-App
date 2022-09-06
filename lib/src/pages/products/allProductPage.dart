import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';

import '../../Widgets/button/customBackButton.dart';
import '../../animations/loadingAnimation.dart';
import '../../configs/appUtils.dart';
import '../../widgets/cardWidget/customGridProducts.dart';
import '../../widgets/textWidget/kText.dart';
import 'productDetailsPage.dart';
import 'wholesaleProductPage.dart';

class AllProductPage extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'All Products',
          fontSize: 16,
        ),
      ),
      body: Padding(
        padding: paddingH10,
        child: ListView(children: [
          sizeH10,
          allProductListC.allProductList.isEmpty
              ? LoadingAnimation()
              : Obx(
                  () => GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.70,
                    ),
                    itemCount: allProductListC.allProductList.length,
                    itemBuilder: (context, index) {
                      final item = allProductListC.allProductList[index];

                      return CustomGridCardWidget(
                        discount: item.productdiscount,
                        disprice: item.productnewprice,
                        oldprice: item.productoldprice,
                        onTap: () => item.productnewprice == null
                            ? Get.to(
                                WholesaleProductPage(),
                              )
                            : Get.to(
                                ProductDetailsPage(
                                  id: item.id,
                                  proName: item.productname,
                                  image: item.proImage!.image.toString(),
                                ),
                              ),
                        productname: item.productname.toString(),
                        imageUrl: item.proImage == null
                            ? 'public/uploads/logo/1641972847-270257733_895471181169475_2932116256903854071_n.png'
                            : item.proImage!.image.toString(),
                      );
                    },
                  ),
                ),
        ]),
      ),
    );
  }
}
