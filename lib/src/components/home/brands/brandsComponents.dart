import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/brands/brandListPage.dart';
import 'package:needbox_customer/src/pages/brands/brandProductListPage.dart';
import 'package:needbox_customer/src/widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

class BrandsComponents extends StatefulWidget {
  @override
  _BrandsComponentsState createState() => _BrandsComponentsState();
}

class _BrandsComponentsState extends State<BrandsComponents>
    with BaseController {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KText(
              text: "Brands",
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            GestureDetector(
              onTap: () => Get.to(BrandListPage()),
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
          (() => brandListC.isLoading.value == true
              ? Center(child: LoadingAnimation())
              : brandListC.brandsList.isEmpty
                  ? Center(child: EmptyAnimation())
                  : SizedBox(
                      height: 120,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: brandListC.brandsList.length,
                          itemBuilder: (c, i) {
                            final item = brandListC.brandsList[i];
                            return GestureDetector(
                              onTap: () => Get.to(BrandProductListPage(
                                brandName: item.brandName,
                                id: item.id,
                              )),
                              // onTap: (() => Get.to(CampaignProductPage())),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 5,
                                ),
                                child: Container(
                                  width: 120,
                                  child: ClipRRect(
                                    borderRadius: borderRadiusC10,
                                    child: CachedNetworkImageWidget(
                                      imageUrl: item.image.toString(),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )),
        ),
      ],
    );
  }
}
