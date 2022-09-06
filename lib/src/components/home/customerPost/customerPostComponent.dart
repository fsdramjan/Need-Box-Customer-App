// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/models/userAccount/userProfileDetailsModel.dart';
import 'package:needbox_customer/src/pages/customerPost/customerPostDetailsPage.dart';
import 'package:needbox_customer/src/pages/customerPost/customerPostPage.dart';
import 'package:needbox_customer/src/widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';
import 'package:needbox_customer/src/widgets/cardWidget/customCardWidget.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerPostComponent extends StatefulWidget {
  String? userAccessToken;
  @override
  _CustomerPostComponentState createState() => _CustomerPostComponentState();
}

class _CustomerPostComponentState extends State<CustomerPostComponent>
    with BaseController {
  @override
  void initState() {
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
    return Obx(
      () => customerPostListC.isLoading.value == true
          ? Center(child: LoadingAnimation())
          : customerPostListC.customerPostList.length == 0
              ? Center(child: EmptyAnimation())
              : ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KText(
                          text: "Customer Posts",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(CustomerPostPage()),
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
                    Padding(
                      padding: paddingH10V10,
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .6,
                          ),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: customerPostListC.customerPostList.length,
                          itemBuilder: (context, index) {
                            final item =
                                customerPostListC.customerPostList[index];
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        KText(
                                          text: item.title.toString(),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        sizeH5,
                                        KText(
                                          text: item.description.toString(),
                                          maxLines: 3,
                                          textAlign: TextAlign.justify,
                                          fontSize: 14,
                                        ),
                                        sizeH10,
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: white,
                                              radius: 15,
                                              backgroundImage: NetworkImage(
                                                imageBaseUrl +
                                                    item.customer!.image
                                                        .toString(),
                                              ),
                                            ),
                                            sizeW10,
                                            KText(
                                              text: item.customer!.fullName
                                                  .toString(),
                                              fontSize: 14,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  sizeH5,
                                  Spacer(),
                                  widget.userAccessToken == null
                                      ? GestureDetector(
                                          onTap: () => Get.to(
                                            CustomerPostDetailsPage(
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
                                          builder: (context, snapShots) {
                                            switch (snapShots.connectionState) {
                                              case ConnectionState.none:
                                                break;
                                              case ConnectionState.waiting:
                                                return LoadingAnimation(
                                                  height: 50,
                                                  width: 50,
                                                );
                                              case ConnectionState.active:
                                                break;
                                              case ConnectionState.done:
                                                final items = snapShots.data!;
                                                return GestureDetector(
                                                  onTap: () => Get.to(
                                                    CustomerPostDetailsPage(
                                                      title: item.title,
                                                      slug: item.slug,
                                                      id: item.id,
                                                      userToken: widget
                                                          .userAccessToken,
                                                      profileInfo: items,
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
                                                            text:
                                                                'View Details',
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
                    )
                  ],
                ),
    );
  }
}
