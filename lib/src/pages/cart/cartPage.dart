// ignore_for_file: unnecessary_statements

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/widgets/button/customPrimaryButton.dart';
import 'package:needbox_customer/src/widgets/cardWidget/customCardWidget.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

import '../../dummyData/allProductAndCategory.dart';

class CartPage extends StatefulWidget {
  final bool? isBackEnable;

  CartPage({
    required this.isBackEnable,
  });
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            sizeH10,
            Padding(
              padding: paddingH10,
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 2,
                itemBuilder: ((context, index) {
                  final item = allProductAndCategoryList[index];
                  return _productCard(item: item);
                }),
              ),
            ),
            Divider(),
            _cardSummary(),
          ],
        ),
      ),
    );
  }

  _productCard({required AllProductAndCategory item}) => Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: CustomCardWidget(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 120,
                    width: Get.width,
                  ),
                  Positioned(
                    child: Container(
                      height: 120,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: borderRadiusC10,
                        child: Image.network(
                          item.productImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 110,
                    right: 10,
                    top: 8,
                    child: KText(
                      text: item.productName,
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                      fontSize: 14,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Positioned(
                    left: 110,
                    top: 55,
                    child: Row(
                      children: [
                        KText(
                          text: 'price: ',
                          color: black54,
                          fontSize: 12,
                        ),
                        KText(
                          text: '৳${item.productPrice}',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: orangeO50,
                        ),
                        sizeW30,
                        KText(
                          text: 'color: ',
                          color: black54,
                          fontSize: 12,
                        ),
                        KText(
                          text: 'Green',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 110,
                    top: 85,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: borderRadiusC5,
                        color: grey.shade100,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Icon(
                          Icons.delete,
                          color: orangeO50.withOpacity(.5),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 85,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            counter == 1
                                ? null
                                : setState(() {
                                    counter--;
                                  });
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: grey.shade300,
                              borderRadius: borderRadiusC5,
                            ),
                            child: Icon(
                              Icons.remove,
                              size: 20,
                            ),
                          ),
                        ),
                        sizeW10,
                        KText(
                          text: '$counter',
                          fontWeight: FontWeight.w600,
                        ),
                        sizeW10,
                        counter == 40
                            ? Container()
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    counter++;
                                  });
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: grey.shade300,
                                    borderRadius: borderRadiusC5,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  _cardSummary() => Padding(
        padding: paddingH10,
        child: CustomCardWidget(
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
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              sizeH20,
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
                          text: 'Sub Total',
                          fontSize: 12,
                        ),
                        KText(
                          text: '৳999',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
                          text: 'Shipping Fee',
                          fontSize: 12,
                        ),
                        KText(
                          text: '৳60',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
                          text: 'Total',
                          fontSize: 12,
                        ),
                        KText(
                          text: '৳1059',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              sizeH20,
              Padding(
                padding: paddingH10,
                child: customPrimaryButton(
                  color: orangeO50,
                  height: 40,
                  title: 'Place Order',
                  fontWeight: FontWeight.w600,
                  child: KText(text: ''),
                ),
              ),
              sizeH20,
            ],
          ),
        ),
      );
}
