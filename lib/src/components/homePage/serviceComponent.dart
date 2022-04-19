import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/cardWidget/customCardWidget.dart';
import '../../configs/appUtils.dart';
import '../../dummyData/serviceModel.dart';

class ServiceComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 180,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: serviceList.length,
              itemBuilder: (context, index) {
                final item = serviceList[index];

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: CustomCardWidget(
                    child: Container(
                      width: 140,
                      decoration: BoxDecoration(
                          // border: Border.all(color: grey.shade200),
                          ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.all(3.5),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(item.image.toString()),
                                  fit: BoxFit.cover),
                              // borderRadius: BorderRadius.circular(50),
                              shape: BoxShape.circle,
                              // color: Colors.black,
                            ),
                          ),
                          sizeH15,
                          Text(
                            item.title.toString(),
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
