// ignore_for_file: unnecessary_statements

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/models/cart/cartModels.dart';
import 'package:needbox_customer/src/pages/cart/cartPage.dart';
import 'package:needbox_customer/src/pages/imageView/imageViewPage.dart';
import '../../Widgets/cardWidget/customCardWidget.dart';
import '../../models/products/ProductDetailsModel.dart';
import '../../models/products/wholeSaleProductModel.dart';
import '../../widgets/button/customBackButton.dart';
import '../../widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';
import '../../widgets/cardWidget/customGridProducts.dart';
import '../../widgets/snackBar/customSnackbarWidget.dart';
import '../../widgets/textWidget/kText.dart';

class WholesaleProductDetailsPage extends StatefulWidget {
  final int? id;
  final List<Productprice>? productPricing;
  final String? proName;
  final String? image;

  WholesaleProductDetailsPage({
    required this.id,
    required this.productPricing,
    required this.proName,
    required this.image,
  });

  @override
  State<WholesaleProductDetailsPage> createState() =>
      _WholesaleProductDetailsPageState();
}

class _WholesaleProductDetailsPageState
    extends State<WholesaleProductDetailsPage> with BaseController {
  var selectedColor = '';
  var selectedColorName = '';
  bool? isWishListed;
  @override
  Widget build(BuildContext context) {
    productDetailsC.getProductDetails(widget.id);

    cartC.initQuantity();
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: widget.proName.toString(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          fontSize: 18,
        ),
      ),
      body: Padding(
        padding: paddingH10,
        child: ListView(
          shrinkWrap: true,
          primary: false,
          physics: bounchephysics,
          children: [
            sizeH10,
            FutureBuilder<ProductDetailsModel>(
              future: productDetailsC.getProductDetails(widget.id),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return LoadingAnimation();
                }

                final products = snapshot.data!.productdetails;
                final sellerInfo = snapshot.data!.sellerinfo;
                final relatedproduct = snapshot.data!.relatedproduct;
                return Column(
                  children: [
                    CustomCardWidget(
                      onTap: () => Get.to(
                        ImageViewPage(
                          image: products!.proImage!.image.toString(),
                        ),
                      ),
                      child: CachedNetworkImageWidget(
                        isImgCircular: true,
                        imageUrl: products!.proImage!.image.toString(),
                        height: 300,
                        width: Get.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    sizeH10,
                    CustomCardWidget(
                      child: Column(
                        children: [
                          Padding(
                            padding: paddingH10V10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                KText(
                                  text: products.productname.toString(),
                                  textAlign: TextAlign.justify,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                                sizeH20,
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 30,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: black54,
                                              ),
                                            ),
                                            child: Center(
                                              child: KText(
                                                text: 'Quantity',
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 30,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: black54,
                                              ),
                                            ),
                                            child: Center(
                                              child: KText(
                                                text: 'Price/Unit',
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        primary: false,
                                        itemCount:
                                            widget.productPricing!.length,
                                        itemBuilder: ((context, index) {
                                          final item =
                                              widget.productPricing![index];
                                          return Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 30,
                                                  width: Get.width,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: black54,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: KText(
                                                      text:
                                                          '${item.minQty} - ${item.maxQty}',
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 30,
                                                  width: Get.width,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: black54,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: KText(
                                                      text: '৳ ${item.price}',
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }))
                                  ],
                                ),
                                sizeH20,
                                Row(
                                  children: [
                                    KText(
                                      text: 'Stock:',
                                      fontSize: 12,
                                      color: black54,
                                    ),
                                    sizeW5,
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: borderRadiusC10,
                                        border: Border.all(
                                          color: grey.shade300,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 2,
                                        ),
                                        child: Row(
                                          children: [
                                            KText(
                                              text: products.productquantity
                                                  .toString(),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                            KText(
                                              text: ' Available',
                                              fontSize: 12,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                sizeH10,
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: cartC.decrementQnty,
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
                                    Obx(
                                      () => KText(
                                        text: cartC.quantityItems.toString(),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    sizeW10,
                                    GestureDetector(
                                      onTap: cartC.incrementQnty,
                                      child: Obx(
                                        () => cartC.quantityItems.value ==
                                                products.productquantity
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
                                sizeH10,
                                KText(
                                  text: 'Select Color:',
                                  fontSize: 12,
                                ),
                                sizeH10,
                                Container(
                                  height: 50,
                                  // color: orangeO50,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: products.colors!.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: ((context, index) {
                                        final color = products.colors![index];
                                        return GestureDetector(
                                          onTap: (() {
                                            setState(() {
                                              selectedColor =
                                                  color.color.toString();
                                              selectedColorName =
                                                  color.colorName.toString();
                                            });
                                          }),
                                          child: Padding(
                                            padding: paddingH10,
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  radius: 15.2,
                                                  backgroundColor: orangeO50,
                                                  child: CircleAvatar(
                                                    radius: 15,
                                                    // height: 30,
                                                    // width: 30,
                                                    // decoration: BoxDecoration(
                                                    // color: HexColor(
                                                    //     color.color.toString()),
                                                    //   border: Border.all(
                                                    //     color: grey.shade300,
                                                    //   ),
                                                    //   borderRadius:
                                                    //       borderRadiusC10,
                                                    // ),
                                                    backgroundColor: HexColor(
                                                        color.color.toString()),
                                                    child: selectedColor ==
                                                            color.color
                                                        ? Icon(
                                                            Icons.check,
                                                            color:
                                                                color.colorName ==
                                                                        'white'
                                                                    ? black
                                                                    : white,
                                                          )
                                                        : Container(),
                                                  ),
                                                ),
                                                KText(
                                                  text: color.colorName
                                                      .toString(),
                                                  fontSize: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      })),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          ListTile(
                            // leading: CachedNetworkImageWidget(
                            //     imageUrl:
                            //         products.sellerinfo!.shoplogo.toString()),
                            leading: CircleAvatar(
                              backgroundColor: orangeO50,
                            ),

                            title: KText(
                              text: 'Seller',
                              fontSize: 12,
                              color: black54,
                            ),
                            subtitle: KText(
                              text: sellerInfo!.shopname.toString(),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizeH10,
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CustomCardWidget(
                          child: Container(
                            width: Get.width,
                            child: Padding(
                              padding: paddingH10V10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  KText(
                                    text: 'Description:',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Html(
                                    data: products.productdetails.toString(),
                                    style: {
                                      'h1': Style(
                                        color: black54,
                                        fontSize: FontSize.xxLarge,
                                        textAlign: TextAlign.justify,
                                      ),
                                      'br': Style(
                                        color: black54,
                                        fontSize: FontSize.xxLarge,
                                        textAlign: TextAlign.justify,
                                      ),
                                      'p': Style(
                                        color: black54,
                                        fontSize: FontSize.larger,
                                        textAlign: TextAlign.justify,
                                      ),
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: -10,
                          top: -15,
                          child: customBackButton(
                            iconData: Icons.info_outline,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    sizeH20,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Related Products",
                        style: TextStyle(
                          color: basiccolor,
                          fontSize: 18,

                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    sizeH10,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 270,
                        child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            physics: bounchephysics,
                            itemCount: relatedproduct!.data!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (c, i) {
                              final item = relatedproduct.data![i];
                              return SizedBox(
                                width: 180,
                                child: CustomGridCardWidget(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          WholesaleProductDetailsPage(
                                            id: item.id,
                                            proName: item.productname,
                                            image:
                                                item.proImage!.image.toString(),
                                            productPricing:
                                                widget.productPricing,
                                          )),
                                    ),
                                  ),
                                  imageUrl: item.proImage == null
                                      ? 'public/uploads/logo/1641972847-270257733_895471181169475_2932116256903854071_n.png'
                                      : item.proImage!.image.toString(),
                                  productname: item.productname.toString(),
                                  discount: item.productdiscount,
                                  disprice: item.productnewprice,
                                  oldprice: item.productoldprice,
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                );
              }),
            ),
            sizeH40,
            sizeH30,
          ],
        ),
      ),
      bottomSheet: Container(
        height: 60,
        color: white,
        width: Get.width,
        // color: darkBlue,
        child: Padding(
          padding: paddingH10V10,
          child: Row(
            children: [
              Expanded(
                child: FutureBuilder<ProductDetailsModel>(
                  future: productDetailsC.getProductDetails(widget.id),
                  builder: (c, s) {
                    if (!s.hasData) {
                      return Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: borderRadiusC10,
                          color: red,
                        ),
                        alignment: Alignment.center,
                        child: KText(
                          text: 'Add To Cart',
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      );
                    }

                    final item = s.data!.productdetails;

                    return GestureDetector(
                      onTap: () {
                        selectedColor.isEmpty
                            ? snackBarWidget(
                                title: 'Opps!',
                                message: 'Please select a product color',
                                isRed: true,
                              )
                            : cartC.addItemInCart(
                                CartModels(
                                  id: widget.id,
                                  image: item!.proImage!.image,
                                  productname: item.productname == null
                                      ? null
                                      : item.productname,
                                  proNewprice: item.productnewprice == null
                                      ? widget.productPricing!.first.price
                                          as int
                                      : item.productnewprice,
                                  proOldprice: item.productoldprice == null
                                      ? null
                                      : item.productoldprice,
                                  discount: 0,
                                  shippingfee: '',
                                  productColor: selectedColorName.isEmpty
                                      ? ''
                                      : selectedColorName,
                                  quantity: cartC.quantityItems.toInt(),
                                  stock: item.productquantity,
                                ),
                              );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: borderRadiusC10,
                          color: red,
                        ),
                        alignment: Alignment.center,
                        child: KText(
                          text: 'Add To Cart',
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      ),
                    );
                  },
                ),
              ),
              sizeW10,
              // FutureBuilder<ProductDetailsModel>(
              //     future: productDetailsC.getProductDetails(widget.id),
              //     builder: ((context, snapshot) {
              //       if (!snapshot.hasData) {
              //         return Container(
              //           height: 50,
              //           width: 50,
              //           decoration: BoxDecoration(
              //             borderRadius: borderRadiusC10,
              //             color: red,
              //           ),
              //           child: Padding(
              //             padding: EdgeInsets.all(8.0),
              //             child: Icon(
              //               Icons.favorite_outline,
              //               color: white,
              //             ),
              //           ),
              //         );
              //       }

              //       final item = snapshot.data!.productdetails;

              //       return GestureDetector(
              //         onTap: () => favoriteProductC.manageFavorite(
              //           id: widget.id,
              //           productName: widget.proName,
              //           image: widget.image,
              //           proDisPrice: item!.productnewprice,
              //           productColor: item.colors!.first.colorName,
              //           proPrice: item.productoldprice,
              //           discount: item.productdiscount,
              //         ),
              //         child: Container(
              //           height: 50,
              //           width: 50,
              //           decoration: BoxDecoration(
              //             borderRadius: borderRadiusC10,
              //             color: red,
              //           ),
              //           child: Padding(
              //             padding: EdgeInsets.all(8.0),
              //             child: Icon(
              //               Icons.favorite_outline,
              //               color: white,
              //             ),
              //           ),
              //         ),
              //       );
              //     })),
              // sizeW10,
              Expanded(
                child: GestureDetector(
                  onTap: (() {
                    Get.to(
                      CartPage(
                        isBackEnable: true,
                      ),
                    );
                  }),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: borderRadiusC10,
                      color: red,
                    ),
                    alignment: Alignment.center,
                    child: KText(
                      text: 'Buy Now',
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
