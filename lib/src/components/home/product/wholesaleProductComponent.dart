import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/products/wholesaleProductDetailsPage.dart';
import 'package:needbox_customer/src/pages/products/wholesaleProductPage.dart';
import 'package:needbox_customer/src/widgets/cardWidget/customGridProducts.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

class WholesaleComponent extends StatefulWidget {
  @override
  _WholesaleComponentState createState() => _WholesaleComponentState();
}

class _WholesaleComponentState extends State<WholesaleComponent>
    with BaseController {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KText(
              text: "Wholesale Products",
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            GestureDetector(
              onTap: () => Get.to(WholesaleProductPage()),
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
        Obx(
          () => wholesaleProductC.isLoading.value == true
              ? Center(child: LoadingAnimation())
              : wholesaleProductC.wholeSaleProductList.isEmpty
                  ? Center(child: EmptyAnimation())
                  : Padding(
                      padding: paddingH10V10,
                      child: GridView.builder(
                          physics: bounchephysics,
                          shrinkWrap: true,
                          primary: false,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .90,
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
      ],
    );
  }
}
