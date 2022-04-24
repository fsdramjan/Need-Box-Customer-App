import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:needbox_customer/src/components/drawer/sidebarComponent.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/pages/cart/cartPage.dart';
import 'package:needbox_customer/src/pages/home/homePage.dart';
import 'package:needbox_customer/src/pages/userAccount/profilePage.dart';
import 'package:needbox_customer/src/widgets/snackBar/customSnackbarWidget.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

class CustomBottomAppBar extends StatefulWidget {
  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget _currentScreens = HomePage();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      endDrawer: SidebarComponent(),
      body: PageStorage(
        bucket: bucket,
        child: _currentScreens,
      ),
      bottomSheet: SizedBox(
        height: 65,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: 70,
                child: Stack(
                  clipBehavior: Clip.none,
                  // overflow: Overflow.visible,
                  children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: BNBCustomPainter(),
                    ),
                    Center(
                      heightFactor: 0.6,
                      child: Stack(
                        children: [
                          FloatingActionButton(
                            backgroundColor: orangeO50,
                            child: Icon(
                              Icons.shopping_basket,
                              color: white,
                            ),
                            elevation: 0.1,
                            onPressed: () {
                              setState(() {
                                _currentScreens = CartPage(
                                  isBackEnable: false,
                                );
                                currentTab = 5;
                              });
                            },
                          ),
                          Positioned(
                            right: 8,
                            top: 10,
                            child: CircleAvatar(
                              backgroundColor: white,
                              radius: 7,
                              child: KText(
                                text: '2',
                                fontSize: 11,
                                color: orangeO50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.home,
                              color:
                                  currentTab == 0 ? orangeO50 : grey.shade400,
                            ),
                            onPressed: () {
                              setState(() {
                                _currentScreens = HomePage();
                                currentTab = 0;
                              });
                            },
                            splashColor: Colors.white,
                          ),
                          IconButton(
                              icon: Icon(
                                Ionicons.heart,
                                color:
                                    currentTab == 1 ? orangeO50 : grey.shade400,
                              ),
                              onPressed: () {
                                setState(() {
                                  snackBarWidget(
                                    title: 'Cooming soon!',
                                    message: 'This feature added soon.',
                                    isRed: false,
                                  );
                                  currentTab = 1;
                                });
                              }),
                          Container(
                            width: size.width * 0.20,
                          ),
                          IconButton(
                              icon: Icon(
                                Ionicons.person,
                                color:
                                    currentTab == 2 ? orangeO50 : grey.shade400,
                              ),
                              onPressed: () {
                                setState(() {
                                  _currentScreens = ProfilePage();
                                  currentTab = 2;
                                });
                              }),
                          IconButton(
                              icon: Icon(
                                Ionicons.menu,
                                color:
                                    currentTab == 3 ? orangeO50 : grey.shade400,
                              ),
                              onPressed: () {
                                scaffoldKey.currentState!.openEndDrawer();
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
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
      ..color = white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
