import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';
import '../../../animations/loadingAnimation.dart';
import '../../../configs/appUtils.dart';
import '../../../pages/category/serviceSubCategoryPage.dart';
import '../../../widgets/textWidget/kText.dart';

class ServiceComponent extends StatelessWidget with BaseController {
 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 90,
          child: Obx(
            () => serviceCategoryC.isLoading.value == true
                ? LoadingAnimation()
                : serviceCategoryC.serviceCategoryList.isEmpty
                    ? Center(
                        child: EmptyAnimation(
                        height: 100,
                      ))
                    : Center(
                        child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                          
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                serviceCategoryC.serviceCategoryList.length,
                            itemBuilder: (context, index) {
                              final item =
                                  serviceCategoryC.serviceCategoryList[index];

                              return GestureDetector(
                                onTap: () {
                                  // serviceCategoryC.serviceSubCategoryList.clear();

                                  Get.to(
                                    ServiceSubCategoryPage(
                                      categorySlug: item.slug.toString(),
                                    ),
                                  );
                                },
                                child: Container(
                                  // height: 35,
                                  // width: 35,

                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundColor: white,
                                          foregroundColor: grey,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: CachedNetworkImageWidget(
                                              imageUrl: item.image.toString(),
                                            ),
                                          ),
                                        ),
                                        sizeH5,
                                        KText(
                                          text: item.scatename.toString(),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
          ),
        ),
      ],
    );
  }
}
