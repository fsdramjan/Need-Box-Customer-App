import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/widgets/appBar/customTitleAppBar.dart';
import 'package:needbox_customer/src/widgets/cardWidget/customCardWidget.dart';
import 'package:needbox_customer/src/widgets/formField/customFormField.dart';
import '../../models/userAccount/userProfileDetailsModel.dart';
import '../../widgets/button/customPrimaryButton.dart';
import '../../widgets/textWidget/kText.dart';

class OrderCheckOutPage extends StatefulWidget {
  final UserProfileDetailsModel userInfo;

  OrderCheckOutPage({
    required this.userInfo,
  });
  @override
  State<OrderCheckOutPage> createState() => _OrderCheckOutPageState();
}

class _OrderCheckOutPageState extends State<OrderCheckOutPage>
    with BaseController {
  final nameTextC = TextEditingController();

  final phoneTextC = TextEditingController();

  final stateTextC = TextEditingController();

  final houseTextC = TextEditingController();

  final zipTextC = TextEditingController();

  final fullAddressTextC = TextEditingController();

  var selectedPayment;
  @override
  void initState() {
    nameTextC.text = widget.userInfo.fullName == null
        ? ''
        : widget.userInfo.fullName.toString();
    phoneTextC.text = widget.userInfo.phoneNumber == null
        ? ''
        : widget.userInfo.phoneNumber.toString();

    fullAddressTextC.text = widget.userInfo.address == null
        ? ''
        : widget.userInfo.address.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAndTitleAppBar(
        title: 'Order Checkout',
      ),
      body: Padding(
        padding: paddingH10V10,
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            CustomCardWidget(
              child: Padding(
                padding: paddingH10V10,
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: orangeO50,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: Center(
                        child: KText(
                          text: 'Shipping Address',
                          color: white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: grey.shade300,
                        ),
                      ),
                      child: Padding(
                        padding: paddingH10V10,
                        child: Column(
                          children: [
                            customFormField(
                              height: 40,
                              isStarEnable: true,
                              titleText: 'Full Name',
                              hintText: 'Enter full name',
                              controller: nameTextC,
                            ),
                            sizeH10,
                            customFormField(
                              height: 40,
                              isStarEnable: true,
                              titleText: 'Phone Number',
                              hintText: 'Enter phone number',
                              controller: phoneTextC,
                            ),
                            sizeH10,
                            customFormField(
                              height: 40,
                              isStarEnable: false,
                              titleText: 'State Address',
                              hintText: 'Enter state address',
                              controller: stateTextC,
                            ),
                            sizeH10,
                            customFormField(
                              height: 40,
                              isStarEnable: false,
                              titleText: 'House Address',
                              hintText: 'Enter house address',
                              controller: houseTextC,
                            ),
                            sizeH10,
                            customFormField(
                              height: 40,
                              isStarEnable: false,
                              titleText: 'Zip Code',
                              hintText: 'Enter zip code',
                              controller: zipTextC,
                            ),
                            sizeH10,
                            customFormField(
                              height: 40,
                              isStarEnable: true,
                              titleText: 'Full Address',
                              hintText: 'Enter full address',
                              controller: fullAddressTextC,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomCardWidget(
              child: Padding(
                padding: paddingH10V10,
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: orangeO50,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: Center(
                        child: KText(
                          text: 'Payments',
                          color: white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    sizeH20,
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: selectedPayment,
                          onChanged: (value) {
                            setState(() {
                              selectedPayment = value;
                            });
                          },
                          activeColor: orangeO50,
                        ),
                        Image.asset(
                          'assets/images/cod.png',
                          scale: 15,
                        ),
                        sizeW10,
                        KText(
                          text: 'Cash On Delivery',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            _cardSummary(),
          ],
        ),
      ),
    );
  }

  _cardSummary() => CustomCardWidget(
        child: Column(
          children: [
            Container(
              height: 40,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: orangeO50,
              ),
              alignment: Alignment.center,
              child: KText(
                text: 'Cart Summary',
                color: white,
                fontSize: 16,
              ),
            ),
            sizeH20,
            _cardSummaryButton(
              title: 'Items',
              content: cartC.cartCount.toString() + ' -(Items)',
            ),
            _cardSummaryButton(
              title: 'Sub Total',
              content: cartC.subTotalAmount.toString(),
            ),
            _cardSummaryButton(
              title: 'Shipping Fee',
              content: cartC.shippingFee.toString(),
            ),
            _cardSummaryButton(
              title: 'Additional Shipping',
              content: '৳',
            ),
            _cardSummaryButton(
              title: 'No Discount',
              content: '৳',
            ),
            _cardSummaryButton(
              title: 'Earning Point',
              content: '0',
            ),
            _cardSummaryButton(
              title: 'Total',
              content: cartC.totalsAmount.toString(),
            ),
            sizeH20,
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 1,
              itemBuilder: ((context, index) {
                final item = cartC.cartItem[index];
                return GestureDetector(
                  onTap: () {
                    orderSaveC.createNewOrder(
                      item: item,
                      paymentType: selectedPayment == 1 ? 'COD' : null,
                      userInfo: widget.userInfo,
                      totalPrice: cartC.totalsAmount.toString(),
                    );
                  },
                  child: Padding(
                    padding: paddingH10,
                    child: customPrimaryButton(
                      color: orangeO50,
                      height: 40,
                      title: 'Place Order',
                      fontWeight: FontWeight.w600,
                      child: KText(text: ''),
                    ),
                  ),
                );
              }),
            ),
            sizeH20,
          ],
        ),
      );

  _cardSummaryButton({
    required title,
    required content,
  }) =>
      Padding(
        padding: paddingH20,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: grey.shade300),
          ),
          child: Padding(
            padding: paddingH10V10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KText(
                  text: title,
                  fontSize: 12,
                ),
                KText(
                  text: content,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ],
            ),
          ),
        ),
      );
}
