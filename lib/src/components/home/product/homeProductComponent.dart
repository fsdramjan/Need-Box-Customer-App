import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/products/allProductPage.dart';
import 'package:needbox_customer/src/pages/products/wholesaleProductPage.dart';

import '../../../animations/loadingAnimation.dart';
import '../../../configs/appColors.dart';
import '../../../configs/appUtils.dart';
import '../../../pages/products/productDetailsPage.dart';
import '../../../widgets/cardWidget/customGridProducts.dart';
import '../../../widgets/textWidget/kText.dart';

class HomeProductComponent extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KText(
              text: "Featured Products",
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            GestureDetector(
              onTap: () => Get.to(AllProductPage()),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: orangeO50,
                    )),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: KText(
                    text: "See all",
                    color: black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
        sizeH10,
        allProductListC.allProductList.isEmpty
            ? LoadingAnimation()
            : Obx(
                () => allProductListC.isLoading.value == true
                    ? LoadingAnimation()
                    : GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.90,
                        ),
                        itemCount: allProductListC.allProductList.length < 12
                            ? allProductListC.allProductList.length
                            : 12,
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
                                      image:item.proImage==null? null: item.proImage!.image.toString(),
                                    ),
                                  ),
                            productname: item.productname.toString(),
                            imageUrl: item.proImage == null
                                ? 'public/uploads/logo/1655697990-Touch%20your%20Need.jpg'
                                : item.proImage!.image.toString(),
                          );
                        },
                      ),
              ),
      ],
    );
  }
}
