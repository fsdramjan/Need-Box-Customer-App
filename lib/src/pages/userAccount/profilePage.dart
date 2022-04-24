import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/pages/loginSignup/loginPage.dart';
import 'package:needbox_customer/src/pages/orders/orderList.dart';
import 'package:needbox_customer/src/pages/userAccount/editProflePage.dart';
import 'package:needbox_customer/src/pages/userAccount/myAccountPage.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';
import '../../configs/appColors.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: white,
                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: size.height * 6,
                          backgroundImage:
                              AssetImage('assets/images/avatar.png'),
                        ),
                        Text(
                          "QuickTech Ramjan",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size.height * 2.4,
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              sizeH40,
              profilebuttons(
                size,
                Ionicons.person_outline,
                "My Account",
                () => Get.to(MyAccountPage()),
              ),
              profilebuttons(
                size,
                Ionicons.create_outline,
                "Edit Profile",
                () => Get.to(EditProfilePage()),
              ),
              profilebuttons(
                size,
                Ionicons.cart_outline,
                "My Orders",
                () => Get.to(
                  OrderListPage(
                    isBackEnable: true,
                  ),
                ),
              ),
              profilebuttons(
                size,
                Icons.local_shipping_outlined,
                "Shipping Address",
                () {},
              ),
              profilebuttons(
                size,
                Ionicons.search,
                "Track Order",
                () {},
                iconSize: 20,
              ),
              profilebuttons(
                size,
                Ionicons.create,
                "Customer Post",
                () {},
                isDivider: false,
              ),
              sizeH40,
              profilebuttons(
                size,
                Ionicons.log_out_outline,
                "Logout",
                () => Get.to(LoginPage()),
                isDivider: false,
              ),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }

  profilebuttons(
    Size size,
    IconData icon,
    String buttonname,
    void Function()? onTap, {
    bool? isDivider,
    double? iconSize,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 60,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: orangeO50,
                    size: iconSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: KText(
                      text: buttonname,
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: scaffoldColor,
                    child: Icon(
                      Ionicons.chevron_forward_outline,
                      color: orangeO50.withOpacity(.50),
                      size: 15,
                    ),
                  ),
                ],
              ),
              isDivider == false
                  ? Container()
                  : Divider(color: grey.withOpacity(.40)),
            ],
          ),
        ),
      ),
    );
  }
}
