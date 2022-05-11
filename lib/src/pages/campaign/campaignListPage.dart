// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';

import '../../configs/appColors.dart';
import '../../widgets/button/customBackButton.dart';
import '../../widgets/textWidget/kText.dart';

class CampaignListPage extends StatelessWidget with BaseController {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  Future<void> _refresh() {
    _resetList();
    return _getList();
  }

  void _resetList() {
    campaignListC.campaignList.clear();
  }

  Future _getList() {
    campaignListC.getAllCampaignList();
    return appLogoC.getAppLogo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'All Campaigns',
          fontSize: 16,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: paddingH10,
          child: Obx(
            (() => campaignListC.isLoading.value == true
                ? Center(child: LoadingAnimation())
                : campaignListC.campaignList.isEmpty
                    ? Center(child: EmptyAnimation())
                    : RefreshIndicator(
                        onRefresh: _refresh,
                        color: orangeO50,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: campaignListC.campaignList.length,
                            itemBuilder: (c, i) {
                              final item = campaignListC.campaignList[i];
                              return GestureDetector(
                                // onTap: (() => Get.to(CampaignProductPage())),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    height: 350,
                                    width: Get.width,
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
        ),
      ),
    );
  }
}
