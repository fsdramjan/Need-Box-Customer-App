import 'package:flutter/material.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/widgets/button/backButtonWithText.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

import '../../Widgets/cardWidget/customCardWidget.dart';
import '../../components/drawer/sidebarComponent.dart';
import '../../widgets/appBar/customTitleAppBar.dart';

class OrderListPage extends StatefulWidget {
  final bool? isBackEnable;
  OrderListPage({
    this.isBackEnable,
  });
  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: SidebarComponent(),
      appBar: widget.isBackEnable == true
          ? AppBar(
              automaticallyImplyLeading: false,
              title: customBackButtonWithText(title: 'Orders'),
            )
          : customTitleAppBar(
              title: 'Orders',
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
              }),
      body: Padding(
        padding: paddingH10,
        child: ListView(
          physics: bounchephysics,
          children: [
            sizeH10,
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 3,
              itemBuilder: ((context, index) {
                // final item = allProductAndCategoryList[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: CustomCardWidget(
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          padding: paddingH10,
                          decoration: BoxDecoration(
                            color: darkBlue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            children: [
                              _expandedText(
                                title: 'Order ID',
                                textSize: 12,
                                colorText: white,
                                fontWeight: FontWeight.normal,
                              ),
                              _expandedText(
                                title: 'Total Order',
                                textSize: 12,
                                colorText: white,
                                fontWeight: FontWeight.normal,
                              ),
                              _expandedText(
                                title: 'Status',
                                textSize: 12,
                                colorText: white,
                                fontWeight: FontWeight.normal,
                              ),
                              _expandedText(
                                title: 'Invoice',
                                textSize: 12,
                                colorText: white,
                                fontWeight: FontWeight.normal,
                                isDividerShow: false,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          padding: paddingH10,
                          child: Row(
                            children: [
                              _expandedText(
                                title: '473304$index',
                                textSize: 16,
                                colorText: black,
                              ),
                              _expandedText(
                                title: '1059',
                                textSize: 16,
                                colorText: black,
                              ),
                              _expandedText(
                                title: 'Pending',
                                textSize: 16,
                                colorText: black,
                              ),
                              _expandedText(
                                title: 'View',
                                textSize: 16,
                                colorText: black,
                                isDividerShow: false,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _expandedText({
    required String title,
    double? textSize,
    Color? colorText,
    FontWeight? fontWeight,
    bool? isDividerShow,
    bool? isViewButton,
  }) =>
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: isViewButton == true
                    ? IconButton(
                        onPressed: () {},
                        icon: KText(
                          text: 'View',
                        ),
                      )
                    : KText(
                        text: title,
                        fontSize: textSize,
                        color: colorText,
                        fontWeight: fontWeight,
                      ),
              ),
            ),
            isDividerShow == false
                ? Container()
                : Container(
                    height: 50,
                    width: .5,
                    color: grey.shade300,
                  ),
          ],
        ),
      );
}
