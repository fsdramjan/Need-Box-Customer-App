import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/category/allCategoryPage.dart';
import 'package:needbox_customer/src/widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';
import '../../Widgets/cardWidget/customCardWidget.dart';
import '../../animations/loadingAnimation.dart';
import '../../configs/appUtils.dart';
import '../../widgets/textWidget/kText.dart';

class CategoryComponent extends StatefulWidget with BaseController {
  @override
  State<CategoryComponent> createState() => _CategoryComponentState();
}

class _CategoryComponentState extends State<CategoryComponent>
    with BaseController {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KText(
              text: "Categories",
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            GestureDetector(
              onTap: () => Get.to(AllCategoryPage()),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: KText(
                  text: "See all",
                  color: orangeO50,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        sizeH10,
        Container(
          height: 140,
          child: Obx(
            () => allCategoryC.isLoading.value == true
                ? LoadingAnimation()
                : allCategoryC.allCategoryList.isEmpty
                    ? Center(
                        child: EmptyAnimation(
                        height: 100,
                      ))
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: allCategoryC.allCategoryList.length,
                        itemBuilder: (context, index) {
                          final item = allCategoryC.allCategoryList[index];

                          return GestureDetector(
                            onTap: (() =>
                                categoryProductC.getAllCategoryProduct(
                                  id: item.id,
                                  categoryName: item.catname,
                                )),
                            child: CustomCardWidget(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.transparent,
                                        child: CachedNetworkImageWidget(
                                          imageUrl: item.image.toString(),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      sizeH10,
                                      KText(
                                        text: item.catname.toString(),
                                        textAlign: TextAlign.center,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
          ),
        ),
      ],
    );
  }
}
