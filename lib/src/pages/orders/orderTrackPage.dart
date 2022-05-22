import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/widgets/button/customPrimaryButton.dart';
import 'package:needbox_customer/src/widgets/cardWidget/customCardWidget.dart';
import '../../Widgets/button/customBackButton.dart';
import '../../widgets/textWidget/kText.dart';

class OrderTrackPage extends StatefulWidget {
  @override
  State<OrderTrackPage> createState() => _OrderTrackPageState();
}

class _OrderTrackPageState extends State<OrderTrackPage> with BaseController {
  final orderTrackTextC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    orderTrackC.orderTrack.clear();
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'Order Track',
          fontSize: 18,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: paddingH10,
          child: ListView(
            children: [
              sizeH10,
              CustomCardWidget(
                child: Padding(
                  padding: paddingH10V10,
                  child: Column(
                    children: [
                      KText(
                        text: 'Order Track',
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                      sizeH20,
                      _formField(),
                      sizeH20,
                      customPrimaryButton(
                        onTap: () {
                          setState(() {
                            orderTrackC.getTrackingOrder(orderTrackTextC.text);
                          });
                        },
                        color: orangeO50,
                        height: 50,
                        title: 'Track Order',
                        child: Container(),
                      ),
                      sizeH10,
                    ],
                  ),
                ),
              ),
              sizeH10,
              Divider(),
              sizeH10,
              orderTrackTextC.text.isEmpty
                  ? Container()
                  : ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 1,
                      itemBuilder: ((context, index) {
                        final item = orderTrackC.orderTrack;
                        return Obx(
                          () => orderTrackC.orderTrack.length == 0
                              ? Container()
                              : Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: CustomCardWidget(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 40,
                                          padding: paddingH10,
                                          decoration: BoxDecoration(
                                            color: orangeO50,
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
                                              // _expandedText(
                                              //   title: 'Invoice',
                                              //   textSize: 12,
                                              //   colorText: white,
                                              //   fontWeight: FontWeight.normal,
                                              //   isDividerShow: false,
                                              // ),
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
                                                title: item['ordertrack'],
                                                textSize: 16,
                                                colorText: black,
                                              ),
                                              _expandedText(
                                                title: '${item['orderTotal']}',
                                                textSize: 16,
                                                colorText: black,
                                              ),
                                              _expandedText(
                                                title: item['status']['name'],
                                                textSize: 16,
                                                colorText: black,
                                              ),
                                              // _expandedText(
                                              //   isViewButton: true,
                                              //   title: 'View',
                                              //   textSize: 16,
                                              //   colorText: black,
                                              //   isDividerShow: false,
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        );
                      }),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  _formField() {
    return Container(
      height: 45,
      decoration: BoxDecoration(),
      child: TextFormField(
        textAlign: TextAlign.center,
        style: GoogleFonts.sourceSansPro(
          letterSpacing: 1.5,
          fontSize: 20,
        ),
        controller: orderTrackTextC,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadiusC10,
            borderSide: BorderSide(
              color: orangeO50.withOpacity(.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadiusC10,
            borderSide: BorderSide(
              color: orangeO50.withOpacity(.5),
            ),
          ),
          contentPadding: EdgeInsets.only(left: 20),
          hintText: 'Enter Order Track ID',
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
