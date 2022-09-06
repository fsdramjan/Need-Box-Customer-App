import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/campaign/campaignListPage.dart';
import 'package:needbox_customer/src/widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

class CampaignComponents extends StatefulWidget {
  @override
  _CampaignComponentsState createState() => _CampaignComponentsState();
}

class _CampaignComponentsState extends State<CampaignComponents>
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
              text: "Campaigns",
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            GestureDetector(
              onTap: () => Get.to(CampaignListPage()),
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
          (() => campaignListC.isLoading.value == true
              ? Center(child: LoadingAnimation())
              : campaignListC.campaignList.isEmpty
                  ? Center(child: EmptyAnimation())
                  : SizedBox(
                      height: 120,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: campaignListC.campaignList.length,
                          itemBuilder: (c, i) {
                            final item = campaignListC.campaignList[i];
                            return GestureDetector(
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
