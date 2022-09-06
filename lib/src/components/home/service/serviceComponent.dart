// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/models/userAccount/userProfileDetailsModel.dart';
import 'package:needbox_customer/src/pages/category/allServicecategoryPage.dart';
import 'package:needbox_customer/src/pages/category/serviceDetailsDataPage.dart';
import 'package:needbox_customer/src/widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';
import 'package:needbox_customer/src/widgets/cardWidget/customCardWidget.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicesComponent extends StatefulWidget {
  String? userAccessToken;
  @override
  State<ServicesComponent> createState() => _ServicesComponentState();
}

class _ServicesComponentState extends State<ServicesComponent>
    with BaseController {
  @override
  void initState() {
    serviceCategoryDataC.getServiceCategoryData(
      'AC Servicing, Repair & Installation',
      'ac',
    );
    getValidationData();

    super.initState();
  }

  Future getValidationData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString('accessToken');

    setState(() {
      widget.userAccessToken = obtainedToken;

      print('User Access Token: ${widget.userAccessToken}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KText(
              text: "Service Products",
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            GestureDetector(
              onTap: () => Get.to(AllServiceCategoryPage()),
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
        Obx(() => serviceCategoryDataC.isLoading.value == true
            ? LoadingAnimation()
            : sizeH10),
        Obx(
          () => serviceCategoryDataC.isLoading.value == true
              ? LoadingAnimation()
              : Padding(
                  padding: paddingH10V10,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .75,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              widget.userAccessToken == null
                                  ? GestureDetector(
                                      onTap: () => Get.to(
                                        ServiceDetailsDataPage(
                                          title: item.title,
                                          slug: item.slug,
                                          id: item.id,
                                          userToken: widget.userAccessToken,
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
                                    )
                                  : FutureBuilder<UserProfileDetailsModel>(
                                      future: userProfileDetailsC
                                          .getProfileDetails(),
                                      builder: (context, snapshot) {
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.none:
                                            break;
                                          case ConnectionState.waiting:
                                            return Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: LoadingAnimation(
                                                height: 50,
                                              ),
                                            );
                                          case ConnectionState.active:
                                            break;
                                          case ConnectionState.done:
                                            final items = snapshot.data!;
                                            return GestureDetector(
                                              onTap: () => Get.to(
                                                ServiceDetailsDataPage(
                                                  title: item.title,
                                                  slug: item.slug,
                                                  id: item.id,
                                                  profileInfo: items,
                                                  userToken:
                                                      widget.userAccessToken,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: paddingH10,
                                                child: Container(
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        borderRadiusC10,
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
                                            );
                                        }
                                        return Container();
                                      }),
                              sizeH10,
                            ],
                          ),
                        );
                      }),
                ),
        ),
      ],
    );
  }
}
