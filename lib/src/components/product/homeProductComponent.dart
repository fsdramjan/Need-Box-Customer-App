import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';

import '../../animations/loadingAnimation.dart';
import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../pages/products/productDetailsPage.dart';
import '../../widgets/cardWidget/customGridProducts.dart';
import '../../widgets/textWidget/kText.dart';

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
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(8),
                child: KText(
                  text: "See more",
                  color: orangeO50,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
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
                      onTap: () => Get.to(
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
      ],
    );
  }
}
