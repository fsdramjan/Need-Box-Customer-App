import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';

import 'campaignProductPage.dart';

class CampaignListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            sizeH20,
            GestureDetector(
              onTap: (() => Get.to(CampaignProductPage())),
              child: Container(
                height: 130,
                // color: Colors.red,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/campaign1.webp',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            sizeH20,
            GestureDetector(
              onTap: (() => Get.to(CampaignProductPage())),
              child: Container(
                height: 130,
                // color: Colors.red,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/campaign2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            sizeH20,
            GestureDetector(
              onTap: (() => Get.to(CampaignProductPage())),
              child: Container(
                height: 130,
                // color: Colors.red,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/campaign3.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
