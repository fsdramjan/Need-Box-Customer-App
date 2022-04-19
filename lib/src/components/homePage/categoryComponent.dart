import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/cardWidget/customCardWidget.dart';
import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../dummyData/allProductAndCategory.dart';

class CategoryComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Product Categories",
          style: TextStyle(
            color: basiccolor,
            fontSize: 18,
            // fontWeight: FontWeight.w500,
          ),
        ),
        sizeH30,
        SizedBox(
          height: 180,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: allProductAndCategoryList.length,
              itemBuilder: (context, index) {
                final item = allProductAndCategoryList[index];

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: CustomCardWidget(
                    child: Container(
                      width: 140,
                      decoration: BoxDecoration(
                          // border: Border.all(color: grey.shade200),
                          ),
                      child: Column(
                        children: [
                          Container(
                            height: 110,
                            width: 120,
                            margin: EdgeInsets.all(3.5),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(item.categoryImage),
                                  fit: BoxFit.cover),
                              // borderRadius: BorderRadius.circular(50),
                              shape: BoxShape.circle,
                              // color: Colors.black,
                            ),
                          ),
                          Text(
                            item.categoryName,
                            softWrap: true,
                            // "TV & Home Appliances$index",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
