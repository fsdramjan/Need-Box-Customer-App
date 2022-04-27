import 'package:flutter/material.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

import '../../Widgets/button/customBackButton.dart';
import '../../Widgets/cardWidget/customCardWidget.dart';

class OrderListPage extends StatefulWidget {
  final bool? isBackEnable;
  OrderListPage({
    this.isBackEnable,
  });
  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> with BaseController {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'All Orders',
          fontSize: 16,
        ),
      ),
      body: Padding(
        padding: paddingH10,
        child: ListView(
          physics: bounchephysics,
          children: [
            sizeH10,
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: allOrderListC.orderList.length,
              itemBuilder: ((context, index) {
                final item = allOrderListC.orderList[index];
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
                                title: item.ordertrack.toString(),
                                textSize: 16,
                                colorText: black,
                              ),
                              _expandedText(
                                title: item.orderTotal.toString(),
                                textSize: 16,
                                colorText: black,
                              ),
                              _expandedText(
                                title: item.orderStatus.toString(),
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
