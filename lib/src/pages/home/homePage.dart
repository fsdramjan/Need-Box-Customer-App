// ignore_for_file: unused_field, unused_element, unused_local_variable, unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/widgets/searchFormField/searchFormField.dart';

import '../../components/homePage/categoryComponent.dart';
import '../../components/homePage/serviceComponent.dart';
import '../../configs/appColors.dart';
import '../../dummyData/allProductAndCategory.dart';
import '../../widgets/cardWidget/customCardWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    size: 30,
                  ),
                ),
                Expanded(
                  child: searchFormField(),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                height: size.height * 20,
                // color: Colors.red,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/slider1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              sizeH30,
              Text(
                "Service Categories",
                style: TextStyle(
                  color: basiccolor,
                  fontSize: 18,
                  // fontWeight: FontWeight.w500,
                ),
              ),
              sizeH30,
              ServiceComponent(),
              sizeH30,
              CategoryComponent(),
              sizeH30,
              Text(
                "Featured Products",
                style: TextStyle(
                  color: basiccolor,
                  fontSize: size.height * 2.6,
                  // fontWeight: FontWeight.w500,
                ),
              ),
              sizeH30,
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
              SizedBox(height: 40),
            ],
          ),
        ),
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
            sizeH30,

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
          ],
        ),
      ),
    );
  }
}
