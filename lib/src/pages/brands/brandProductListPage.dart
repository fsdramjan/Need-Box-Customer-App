import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import '../../Widgets/button/customBackButton.dart';
import '../../animations/loadingAnimation.dart';
import '../../pages/products/productDetailsPage.dart';
import '../../widgets/cardWidget/customGridProducts.dart';
import '../../widgets/textWidget/kText.dart';

class BrandProductListPage extends StatelessWidget with BaseController {
  final int? id;
  final String? brandName;
  BrandProductListPage({
    required this.id,
    required this.brandName,
  });

  @override
  Widget build(BuildContext context) {
    brandProductListC.getAllBrandProductList(id: id, brandName: brandName);
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: brandName.toString(),
          fontSize: 16,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: paddingH10,
          child: ListView(
            children: [
              Obx(
                () => brandProductListC.isLoading.value == true
                    ? Center(child: LoadingAnimation())
                    : brandProductListC.brandProductList.isEmpty
                        ? EmptyAnimation()
                        : GridView.builder(
                            shrinkWrap: true,
                            primary: false,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.65,
                            ),
                            itemCount:
                                brandProductListC.brandProductList.length,
                            itemBuilder: (context, index) {
                              final item =
                                  brandProductListC.brandProductList[index];

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
                                    ? null
                                    : item.proImage!.image.toString(),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
