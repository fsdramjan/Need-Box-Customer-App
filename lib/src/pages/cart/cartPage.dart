import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/widgets/button/customPrimaryButton.dart';
import 'package:needbox_customer/src/widgets/cardWidget/customCardWidget.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

import '../../dummyData/allProductAndCategory.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          sizeH20,
          Padding(
            padding: paddingH10,
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 2,
              itemBuilder: ((context, index) {
                final item = allProductAndCategoryList[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 15),
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
                              top: 50,
                              child: Row(
                                children: [
                                  KText(
                                    text: 'price: ',
                                    color: black54,
                                  ),
                                  KText(
                                    text: '৳${item.productPrice}',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: orangeO50,
                                  ),
                                  sizeW30,
                                  KText(
                                    text: 'color: ',
                                    color: black54,
                                  ),
                                  KText(
                                    text: 'Green',
                                    fontWeight: FontWeight.w600,
                                    color: orangeO50,
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
                                  color: grey.shade200,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Icon(
                                    Icons.delete,
                                    color: red.withOpacity(.9),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 70,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  counter == 1
                                      ? Container()
                                      : IconButton(
                                          onPressed: () {
                                            setState(() {
                                              counter--;
                                            });
                                          },
                                          icon: Icon(
                                            Ionicons.remove_circle,

                                            color: orangeO50,
                                            // size: 25,
                                          ),
                                        ),
                                  KText(
                                    text: '$counter',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        counter++;
                                      });
                                    },
                                    icon: Icon(
                                      Ionicons.add_circle,
                                      color: orangeO50,
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
              }),
            ),
          ),
          Divider(),
          Padding(
            padding: paddingH10,
            child: CustomCardWidget(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: Get.width,
                    color: orangeO50,
                    alignment: Alignment.center,
                    child: KText(
                      text: 'Cart Summary',
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
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
                        padding: paddingH20V20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            KText(
                              text: 'Sub Total',
                            ),
                            KText(
                              text: '৳999',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
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
                        padding: paddingH20V20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            KText(
                              text: 'Shipping Fee',
                            ),
                            KText(
                              text: '৳60',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
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
                        padding: paddingH20V20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            KText(
                              text: 'Total',
                            ),
                            KText(
                              text: '৳1059',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
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
                      child: KText(text: ''),
                    ),
                  ),
                  sizeH30,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
