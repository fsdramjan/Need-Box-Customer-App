// ignore_for_file: unnecessary_statements

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:needbox_customer/src/components/drawer/sidebarComponent.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/pages/cart/cartPage.dart';
import 'package:needbox_customer/src/pages/home/homePage.dart';
import 'package:needbox_customer/src/pages/loginSignup/loginPage.dart';
import 'package:needbox_customer/src/pages/products/favoriteProductPage.dart';
import 'package:needbox_customer/src/pages/userAccount/profilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class CustomBottomAppBar extends StatefulWidget {
  String? userAccessToken;

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget _currentScreens = HomePage();

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    getValidationData();

    print(widget.userAccessToken);

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
      resizeToAvoidBottomInset: false,
      key: scaffoldKey, endDrawer: SidebarComponent(),
      body: Stack(
        children: [
          PageStorage(
            bucket: bucket,
            child: _currentScreens,
          ),
          _bottomNavBar(),
        ],
      ),
      // bottomSheet: SizedBox(
      //   height: 65,
      //   child: Stack(
      //     clipBehavior: Clip.none,
      //     children: [
      //       Positioned(
      //         bottom: 0,
      //         left: 0,
      //         child: Container(
      //           width: size.width,
      //           height: 70,
      //           child: Stack(
      //             clipBehavior: Clip.none,
      //             // overflow: Overflow.visible,
      //             children: [
      //               CustomPaint(
      //                 size: Size(size.width, 80),
      //                 painter: BNBCustomPainter(),
      //               ),
      //               Center(
      //                 heightFactor: 0.6,
      //                 child: Stack(
      //                   children: [
      //                     FloatingActionButton(
      //                       backgroundColor: orangeO50,
      //                       child: Icon(
      //                         Icons.shopping_basket,
      //                         color: white,
      //                       ),
      //                       elevation: 0.1,
      //                       onPressed: () {
      // setState(() {
      //   _currentScreens = CartPage(
      //     isBackEnable: false,
      //   );
      //   currentTab = 5;
      // });
      //                       },
      //                     ),
      //                     Positioned(
      //                       right: 8,
      //                       top: 10,
      //                       child: CircleAvatar(
      //                         backgroundColor: white,
      //                         radius: 7,
      //                         child: KText(
      //                           text: '2',
      //                           fontSize: 11,
      //                           color: orangeO50,
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               Container(
      //                 width: size.width,
      //                 height: 80,
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   children: [
      //                     IconButton(
      //                       icon: Icon(
      //                         Icons.home,
      //                         color:
      //                             currentTab == 0 ? orangeO50 : grey.shade400,
      //                       ),
      //                       onPressed: () {
      //                         setState(() {
      //                           _currentScreens = HomePage();
      //                           currentTab = 0;
      //                         });
      //                       },
      //                       splashColor: Colors.white,
      //                     ),
      //                     IconButton(
      //                         icon: Icon(
      //                           Ionicons.heart,
      //                           color:
      //                               currentTab == 1 ? orangeO50 : grey.shade400,
      //                         ),
      //                         onPressed: () {
      //                           setState(() {
      //                             snackBarWidget(
      //                               title: 'Cooming soon!',
      //                               message: 'This feature added soon.',
      //                               isRed: false,
      //                             );
      //                             currentTab = 1;
      //                           });
      //                         }),
      //                     Container(
      //                       width: size.width * 0.20,
      //                     ),
      //                     IconButton(
      //                         icon: Icon(
      //                           Ionicons.person,
      //                           color:
      //                               currentTab == 2 ? orangeO50 : grey.shade400,
      //                         ),
      //                         onPressed: () {
      //                           setState(() {
      //                             _currentScreens = ProfilePage();
      //                             currentTab = 2;
      //                           });
      //                         }),
      //                     IconButton(
      //                         icon: Icon(
      //                           Ionicons.menu,
      //                           color:
      //                               currentTab == 3 ? orangeO50 : grey.shade400,
      //                         ),
      //                         onPressed: () {
      //                           scaffoldKey.currentState!.openEndDrawer();
      //                         }),
      //                   ],
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  _bottomNavBar() {
    final size = MediaQuery.of(context).size;

    return Positioned(
      bottom: -10,
      child: SizedBox(
        width: size.width,
        height: 80,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width, 80),
              painter: BNBCustomPainter(),
            ),
            Center(
              heightFactor: 0.6,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _currentScreens = CartPage(
                      isBackEnable: false,
                    );
                    currentTab = 4;
                  });
                },
                backgroundColor: orangeO50,
                elevation: 8.0,
                child: Icon(Icons.shopping_basket),
              ),
            ),
            SizedBox(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    color: currentTab == 0 ? orangeO50 : grey.shade400,
                    onPressed: () {
                      setState(() {
                        _currentScreens = HomePage();
                        currentTab = 0;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Ionicons.heart),
                    color: currentTab == 1 ? orangeO50 : grey.shade300,
                    onPressed: () {
                      setState(() {
                        _currentScreens = ProductFavoritePage();
                        currentTab = 1;
                      });
                    },
                  ),
                  SizedBox(width: size.width * 0.20),
                  IconButton(
                    icon: Icon(Ionicons.person),
                    color: currentTab == 2 ? orangeO50 : grey.shade300,
                    onPressed: () {
                      currentTab == 2
                          ? null
                          : setState(() {
                              _currentScreens = widget.userAccessToken == null
                                  ? LoginPage()
                                  : ProfilePage();
                              currentTab = 2;
                            });
                    },
                  ),
                  IconButton(
                    icon: Icon(Ionicons.menu),
                    color: grey.shade300,
                    onPressed: () {
                      setState(() {
                        scaffoldKey.currentState!.openEndDrawer();
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 8, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BNBCustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BNBCustomPainter oldDelegate) => false;
}
