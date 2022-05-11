// ignore_for_file: unnecessary_statements

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/orders/orderCheckoutPage.dart';
import 'package:needbox_customer/src/pages/products/productDetailsPage.dart';
import 'package:needbox_customer/src/widgets/button/customPrimaryButton.dart';
import 'package:needbox_customer/src/widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';
import 'package:needbox_customer/src/widgets/cardWidget/customCardWidget.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';
import '../../models/cart/cartModels.dart';
import '../../models/userAccount/userProfileDetailsModel.dart';

class CartPage extends StatefulWidget {
  final bool? isBackEnable;

  CartPage({
    required this.isBackEnable,
  });
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with BaseController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => cartC.cartItem.length == 0
              ? EmptyAnimation(
                  title: 'There is no cart product',
                )
              : ListView(
                  children: [
                    sizeH10,
                    Padding(
                      padding: paddingH10,
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: cartC.cartItem.length,
                        itemBuilder: ((context, index) {
                          final item = cartC.cartItem[index];
                          return _productCard(item: item);
                        }),
                      ),
                    ),
                    Divider(),
                    _cardSummary(),
                  ],
                ),
        ),
      ),
    );
  }

//
  _productCard({required CartModels item}) => Padding(
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
                    child: GestureDetector(
                      onTap: () => Get.to(
                        ProductDetailsPage(
                          id: item.id,
                          proName: item.productname,
                          image: item.image,
                        ),
                      ),
                      child: Container(
                        height: 120,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: borderRadiusC10,
                          child: CachedNetworkImageWidget(
                            imageUrl: item.image.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 110,
                    right: 10,
                    top: 8,
                    child: KText(
                      text: item.productname.toString(),
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
                          text: '৳${item.proNewprice}',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: orangeO50,
                        ),
                        sizeW30,
                        item.productColor == null
                            ? Container()
                            : KText(
                                text: 'color: ',
                                color: black54,
                                fontSize: 12,
                              ),
                        item.productColor == null
                            ? Container()
                            : KText(
                                text: item.productColor.toString(),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 85,
                    child: GestureDetector(
                      onTap: () {
                        cartC.removeCartItem(
                          id: item.id,
                          cartProducts: item,
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Icon(
                          Ionicons.trash_outline,
                          size: 20,
                          color: orangeO50.withOpacity(.5),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 110,
                    top: 85,
                    child: Obx(
                      () => Row(
                        children: [
                          GestureDetector(
                            onTap: () => cartC.quantityMinus(item),
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
                            text: item.quantity.toString(),
                            fontWeight: FontWeight.w600,
                          ),
                          sizeW10,
                          GestureDetector(
                            onTap: () => cartC.quantityAdd(item),
                            child: Obx(
                              () => item.quantity.value == item.stock
                                  ? Container()
                                  : Container(
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
                          ),
                        ],
                      ),
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
                          text: cartC.subTotalAmount.toString(),
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
                          text: cartC.shippingFee.toString(),
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
                          text: cartC.totalsAmount.toString(),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              sizeH20,
              FutureBuilder<UserProfileDetailsModel>(
                future: userProfileDetailsC.getProfileDetails(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return LoadingAnimation(
                      height: 50,
                      width: 50,
                    );
                  }

                  final item = snapshot.data!;

                  return GestureDetector(
                    onTap: () => Get.to(OrderCheckOutPage(userInfo: item,)),
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
        ),
      );
}
