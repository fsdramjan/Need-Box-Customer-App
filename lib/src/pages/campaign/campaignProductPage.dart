// ignore_for_file: unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needbox_customer/src/widgets/button/customBackButton.dart';

import '../../Widgets/cardWidget/customCardWidget.dart';
import '../../configs/appColors.dart';
import '../../dummyData/allProductAndCategory.dart';
import '../../widgets/searchFormField/searchFormField.dart';

class CampaignProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          80,
        ),
        child: Container(
          color: white,
          child: Padding(
            padding: EdgeInsets.only(top: 25),
            child: Row(
              children: [
                customBackButton(),
                Expanded(
                  child: searchFormField(),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          GridView.builder(
            shrinkWrap: true,
            primary: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // mainAxisSpacing: 5,
              // crossAxisSpacing: 5,
              childAspectRatio: 0.60,
            ),
            itemCount: allProductAndCategoryList.length,
            itemBuilder: (context, index) {
              final item = allProductAndCategoryList[index];

              return allProductCard(
                size,
                item.productImage,
                item.productName,
                item.productDisPrice,
                item.productPrice,
                item.productDiscount,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget allProductCard(
    var size,
    String? url,
    String productname,
    String price,
    String oldprice,
    String discount,
  ) {
    return GestureDetector(
      onTap: () {},
      child: CustomCardWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  // padding: const EdgeInsets.all(3),
                  color: Colors.white,
                  width: Get.width,
                  height: size.height * 26,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: url.toString(),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                discount != null
                    ? Positioned.fill(
                        child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, top: 5),
                          child: Container(
                            height: 20,
                            width: 45,
                            decoration: BoxDecoration(
                                color: logoColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "$discount %",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ))
                    : Container(),
              ],
            ),
            SizedBox(height: 5),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                productname,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
              ),
            ),
            // Text(price),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: oldprice,
                    style: GoogleFonts.openSans(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 11,
                      color: Colors.grey.shade700,
                    )),
                TextSpan(text: "   "),
                TextSpan(
                    text: "$price ৳",
                    style: GoogleFonts.openSans(
                      // fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    )),
              ])),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
