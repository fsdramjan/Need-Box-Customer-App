// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';

import 'package:needbox_customer/src/widgets/appBar/customTitleAppBar.dart';
import 'package:needbox_customer/src/widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';
import 'package:needbox_customer/src/widgets/cardWidget/customCardWidget.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../animations/loadingAnimation.dart';
import '../../models/userAccount/userProfileDetailsModel.dart';
import 'customerPostDetailsPage.dart';

class CustomerPostPage extends StatefulWidget with BaseController {
  String? userAccessToken;

  @override
  State<CustomerPostPage> createState() => _CustomerPostPageState();
}

class _CustomerPostPageState extends State<CustomerPostPage>
    with BaseController {
  Future<void> _refresh() {
    _resetList();
    return _getList();
  }

  void _resetList() {
    customerPostListC.customerPostList.clear();
  }

  Future _getList() {
    customerPostListC.getAllCustomerPost();
    return appLogoC.getAppLogo();
  }

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
    return Scaffold(
      appBar: backAndTitleAppBar(title: 'Customer Post'),
      body: Obx(
        () => customerPostListC.isLoading.value == true
            ? Center(child: LoadingAnimation())
            : customerPostListC.customerPostList.length == 0
                ? Center(child: EmptyAnimation())
                : RefreshIndicator(
                    onRefresh: _refresh,
                    color: orangeO50,
                    child: ListView(
                      children: [
                        Padding(
                          padding: paddingH10V10,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .58,
                              ),
                              shrinkWrap: true,
                              primary: false,
                              itemCount:
                                  customerPostListC.customerPostList.length,
                              itemBuilder: (context, index) {
                                final item =
                                    customerPostListC.customerPostList[index];
                                return CustomCardWidget(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            )
                                          : FutureBuilder<
                                                  UserProfileDetailsModel>(
                                              future: userProfileDetailsC
                                                  .getProfileDetails(),
                                              builder: (context, snapShots) {
                                                switch (
                                                    snapShots.connectionState) {
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
                                                    final items =
                                                        snapShots.data!;
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
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                borderRadiusC10,
                                                            color: orangeO50,
                                                          ),
                                                          child: Center(
                                                            child: Padding(
                                                              padding:
                                                                  paddingH10,
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
                  ),
      ),
    );
  }
}
