import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/category/serviceDetailsDataPage.dart';
import 'package:needbox_customer/src/widgets/appBar/customTitleAppBar.dart';
import 'package:needbox_customer/src/widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';
import 'package:needbox_customer/src/widgets/cardWidget/customCardWidget.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

class ServiceCategoryDataPage extends StatelessWidget with BaseController {
  final String title;
  final String slug;

  ServiceCategoryDataPage({
    required this.title,
    required this.slug,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAndTitleAppBar(title: title),
      body: Obx(
        () => serviceCategoryDataC.serviceCategoryData.length == 0
            ? EmptyAnimation()
            : ListView(
                children: [
                  Padding(
                    padding: paddingH10V10,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .7,
                        ),
                        shrinkWrap: true,
                        primary: false,
                        itemCount:
                            serviceCategoryDataC.serviceCategoryData.length,
                        itemBuilder: (context, index) {
                          final item =
                              serviceCategoryDataC.serviceCategoryData[index];
                          return CustomCardWidget(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  width: Get.width,
                                  child: CachedNetworkImageWidget(
                                    imageUrl: item.image.toString(),
                                    fit: BoxFit.cover,

                                    // height: 200,
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding: paddingH10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      KText(
                                        text: item.title.toString(),
                                        fontSize: 14,
                                      ),
                                      sizeH5,
                                      KText(
                                        text: '${item.price}' + ' TK',
                                        fontWeight: FontWeight.w600,
                                        color: orangeO50,
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () => Get.to(
                                    ServiceDetailsDataPage(
                                      title: item.title,
                                      slug: item.slug,
                                      id: item.id,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: paddingH10,
                                    child: Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: borderRadiusC10,
                                        color: orangeO50,
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: paddingH10,
                                          child: KText(
                                            text: 'View Details',
                                            color: white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                sizeH10,
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
      ),
    );
  }
}
