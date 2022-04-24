import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/pages/brands/brandListPage.dart';
import 'package:needbox_customer/src/pages/campaign/campaignListPage.dart';
import 'package:needbox_customer/src/pages/category/allCategoryPage.dart';
import 'package:needbox_customer/src/pages/home/bottomAppBar.dart';
import 'package:needbox_customer/src/pages/loginSignup/loginPage.dart';
import 'package:needbox_customer/src/pages/products/specialOfferProductPage.dart';
import 'package:needbox_customer/src/pages/shop/shopListPage.dart';
import 'package:needbox_customer/src/pages/userAccount/myAccountPage.dart';
import 'package:needbox_customer/src/widgets/button/customBackButton.dart';
import 'package:needbox_customer/src/widgets/cardWidget/customCardWidget.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';
import 'package:url_launcher/url_launcher.dart';

class SidebarComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: Get.height / 1.2,
                child: Padding(
                  padding: paddingH10,
                  child: Column(
                    children: [
                      CustomCardWidget(
                        child: Padding(
                          padding: paddingH10V10,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/images/avatar.png'),
                              ),
                              sizeW10,
                              GestureDetector(
                                onTap: () => Get.to(MyAccountPage()),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    KText(
                                      text: 'QuickTech Ramjan',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    KText(
                                      text: 'View Profile',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: black54,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              customBackButton(iconData: Icons.close),
                            ],
                          ),
                        ),
                      ),
                      // sizeH20,
                      Container(
                        height: Get.height / 1.4,
                        // color: red,
                        child: ListView(
                          shrinkWrap: true,
                          primary: false,
                          children: [
                            _buttonWithOutArrow(
                              onTap: (() => Get.offAll(CustomBottomAppBar())),
                              icons: Ionicons.home_outline,
                              title: 'Home',
                            ),
                            _buttonWithOutArrow(
                              onTap: (() => Get.to(SpecialOfferProductPage())),
                              icons: Ionicons.gift_outline,
                              title: 'Special Offer',
                            ),
                            _buttonWithOutArrow(
                              onTap: (() => Get.to(CampaignListPage())),
                              icons: Ionicons.megaphone_outline,
                              title: 'Campaigns',
                            ),
                            _buttonWithOutArrow(
                              onTap: (() => Get.to(AllCategoryPage())),
                              icons: Ionicons.list,
                              title: 'All Category',
                            ),
                            _buttonWithOutArrow(
                              onTap: (() => Get.offAll(CustomBottomAppBar())),
                              icons: Ionicons.medkit_outline,
                              title: 'All Services',
                            ),
                            _buttonWithOutArrow(
                              onTap: (() => Get.to(ShopListPage())),
                              icons: Ionicons.storefront_outline,
                              title: 'All Shops',
                            ),
                            _buttonWithOutArrow(
                              onTap: (() => Get.to(BrandListPage())),
                              icons: Ionicons.ribbon_outline,
                              title: 'Brands',
                            ),
                            _buttonWithOutArrow(
                              onTap: (() => Get.offAll(CustomBottomAppBar())),
                              icons: Ionicons.create_outline,
                              title: 'Customer Post',
                            ),
                            _buttonWithOutArrow(
                              onTap: (() => Get.offAll(CustomBottomAppBar())),
                              icons: Ionicons.paper_plane_outline,
                              title: 'Contact Us',
                            ),
                            sizeH10,
                            Divider(),
                            sizeH10,
                            _buttonWithOutArrow(
                              onTap: (() => Get.offAll(LoginPage())),
                              icons: Ionicons.log_out_outline,
                              title: 'Logout',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // sizeH10,

            CustomCardWidget(
              child: Container(
                height: 60,
                width: Get.width,
                // color: orangeO50,
                child: Padding(
                  padding: paddingH10,
                  child: Row(
                    children: [
                      KText(
                        text: 'Design & Developed By',
                        fontSize: 14,
                        color: black54,
                      ),
                      sizeW5,
                      TextButton(
                        onPressed: () async {
                          final _url = 'https://quicktech-ltd.com';
                          if (!await launch(_url))
                            throw 'Could not launch $_url';
                        },
                        child: CustomCardWidget(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 3,
                            ),
                            child: KText(
                              text: 'QuickTech IT',
                              color: orangeO50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buttonWithOutArrow({
    required void Function()? onTap,
    required String title,
    required IconData icons,
  }) =>
      CustomCardWidget(
        onTap: onTap,
        child: Container(
          height: 40,
          width: Get.width,
          alignment: Alignment.center,
          child: Padding(
            padding: paddingH10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icons,
                  size: 20,
                ),
                sizeW10,
                KText(
                  text: title,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                Spacer(),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: grey.shade200,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                    color: orangeO50,
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
