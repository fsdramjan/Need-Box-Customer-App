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

class ShopDetailsPage extends StatefulWidget with BaseController {
  final int? id;
  final String? shopName;
  ShopDetailsPage({
    required this.id,
    required this.shopName,
  });

  @override
  State<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> with BaseController {
  @override
  void initState() {
    shopDetailsC.getShopDetails(widget.id);
    shopProductC.getAllShopProduct(shopId: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: widget.shopName.toString(),
          fontSize: 16,
        ),
      ),
      body: Padding(
        padding: paddingH10,
        child: ListView(
          children: [
            FutureBuilder<ShopDetailsModel>(
                future: shopDetailsC.getShopDetails(widget.id),
                builder: (context, snapShots) {
                  switch (snapShots.connectionState) {
                    case ConnectionState.none:
                      break;
                    case ConnectionState.waiting:
                      return LoadingAnimation();
                    case ConnectionState.active:
                      break;
                    case ConnectionState.done:
                      final item = snapShots.data!;
                      return Container(
                        height: 200,
                        width: Get.width,
                        child: CachedNetworkImageWidget(
                          imageUrl: item.shoplogo.toString(),
                        ),
                      );
                  }
                  return Container();
                }),
            sizeH10,
            Divider(),
            sizeH10,
            KText(
              text: 'Shop Products',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            sizeH10,
            Obx(
              () => shopProductC.isLoading.value == true
                  ? Center(child: LoadingAnimation())
                  : shopProductC.shopProduct.isEmpty
                      ? EmptyAnimation()
                      : GridView.builder(
                          shrinkWrap: true,
                          primary: false,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.65,
                          ),
                          itemCount: shopProductC.shopProduct.length,
                          itemBuilder: (context, index) {
                            final item = shopProductC.shopProduct[index];

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
                              imageUrl: item.proImage!.image.toString(),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
