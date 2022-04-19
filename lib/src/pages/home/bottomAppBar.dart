// ignore_for_file: unused_element

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:needbox_customer/src/pages/campaign/campaignListPage.dart';
import 'package:needbox_customer/src/pages/cart/cartPage.dart';
import 'package:needbox_customer/src/pages/userAccount/profilePage.dart';

import '../../configs/appColors.dart';
import 'homePage.dart';

class CustomBottomAppBar extends StatefulWidget {
  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  var selectedIndex = 0;
  List<Widget> listWidgets = [
    HomePage(),
    CampaignListPage(),
    CampaignListPage(),
    CartPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: listWidgets[selectedIndex],
        bottomNavigationBar: StyleProvider(
          style: Style(),
          child: ConvexAppBar(
            style: TabStyle.textIn,
            color: orangeO50,
            backgroundColor: orangeO50,
            items: [
              TabItem(
                icon: Icon(Ionicons.home, color: white),
                title: 'Home',
                // activeIcon: Icon(Ionicons.home, color: white),
              ),
              TabItem(
                  icon: Icon(Ionicons.megaphone, color: white),
                  // activeIcon: Icon(Ionicons.megaphone, color: white),
                  title: 'Campaign'),
              TabItem(
                  icon: Icon(Ionicons.list, color: white), title: 'Order List'),
              TabItem(
                icon: Icon(Ionicons.cart, color: white),
                title: 'Cart',
                // activeIcon: Icon(Ionicons.cart, color: white),
              ),
              TabItem(
                icon: Icon(Ionicons.person, color: white),
                title: 'Profile',
                // activeIcon: Icon(Ionicons.person, color: white),
              ),
            ],
            initialActiveIndex: 0,
            onTap: onItemTapped,
          ),
        ));
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 20;

  @override
  TextStyle textStyle(Color color) {
    return TextStyle(fontSize: 17, color: white);
  }
}
