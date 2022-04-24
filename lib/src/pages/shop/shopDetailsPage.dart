import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/models/shop/shopDetailsModel.dart';
import 'package:needbox_customer/src/widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';
import '../../Widgets/button/customBackButton.dart';
import '../../animations/loadingAnimation.dart';
import '../../pages/products/productDetailsPage.dart';
import '../../widgets/cardWidget/customGridProducts.dart';
import '../../widgets/textWidget/kText.dart';

class ShopDetailsPage extends StatelessWidget with BaseController {
  final int? id;
  final String? shopName;
  ShopDetailsPage({
    required this.id,
    required this.shopName,
  });

  @override
  Widget build(BuildContext context) {
    shopDetailsC.getShopDetails(id);
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: shopName.toString(),
          fontSize: 16,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: paddingH10,
          child: ListView(
            children: [
              FutureBuilder<ShopDetailsModel>(
                future: shopDetailsC.getShopDetails(id),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: EmptyAnimation(),
                    );
                  }

                  final item = snapshot.data!;

                  return Column(
                    children: [
                      Container(
                        height: 200,
                        width: Get.width,
                        child: CachedNetworkImageWidget(
                          imageUrl: item.shopbanner.toString(),
                        ),
                      )
                    ],
                  );
                }),
              ),
              // Obx(
              //   () => brandProductListC.isLoading.value == true
              //       ? Center(child: LoadingAnimation())
              //       : brandProductListC.brandProductList.isEmpty
              //           ? EmptyAnimation()
              //           : GridView.builder(
              //               shrinkWrap: true,
              //               primary: false,
              //               gridDelegate:
              //                   SliverGridDelegateWithFixedCrossAxisCount(
              //                 crossAxisCount: 2,
              //                 childAspectRatio: 0.65,
              //               ),
              //               itemCount:
              //                   brandProductListC.brandProductList.length,
              //               itemBuilder: (context, index) {
              //                 final item =
              //                     brandProductListC.brandProductList[index];

              //                 return CustomGridCardWidget(
              //                   discount: item.productdiscount,
              //                   disprice: item.productnewprice,
              //                   oldprice: item.productoldprice,
              //                   onTap: () => Get.to(
              //                     ProductDetailsPage(
              //                       id: item.id,
              //                       proName: item.productname,
              //                     ),
              //                   ),
              //                   productname: item.productname.toString(),
              //                   imageUrl: item.proImage!.image.toString(),
              //                 );
              //               },
              //             ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
