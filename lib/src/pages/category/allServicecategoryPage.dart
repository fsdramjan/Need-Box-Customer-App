import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/controllers/services/serviceCategoryController.dart';
import '../../Widgets/button/customBackButton.dart';
import '../../Widgets/cardWidget/customCardWidget.dart';
import '../../configs/appUtils.dart';
import '../../widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';
import '../../widgets/textWidget/kText.dart';
import 'serviceSubCategoryPage.dart';

class AllServiceCategoryPage extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    ServiceCategoryController().serviceCategoryList.clear();

    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'All Services',
          fontSize: 18,
        ),
      ),
      body: SafeArea(
        child: serviceCategoryC.serviceCategoryList.length == 0
            ? EmptyAnimation()
            : GridView.builder(
                shrinkWrap: true,
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                ),
                itemCount: serviceCategoryC.serviceCategoryList.length,
                itemBuilder: (context, index) {
                  final item = serviceCategoryC.serviceCategoryList[index];

                  return serviceCategoryC.isLoading.value == true
                      ? LoadingAnimation()
                      : GestureDetector(
                          onTap: () {
                            serviceCategoryC.serviceSubCategoryList.clear();

                            Get.to(ServiceSubCategoryPage(
                              categorySlug: item.slug,
                            ));
                            // serviceCategoryC
                            //     .getAllServiceSubCategory(item.slug);
                          },
                          child: CustomCardWidget(
                            child: Container(
                              width: 140,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CachedNetworkImageWidget(
                                    imageUrl: item.image.toString(),
                                    width: 110,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  ),
                                  sizeH10,
                                  Text(
                                    item.scatename.toString(),
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                },
              ),
      ),
    );
  }
}
