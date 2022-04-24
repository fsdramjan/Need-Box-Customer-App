import 'package:flutter/material.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/textWidget/kText.dart';

class ServiceComponent extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: [
        FittedBox(
          child: Container(
            height: 35,
            // color: red,
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: serviceList.length,
              scrollDirection: Axis.horizontal,
              // padding: paddingH10,
              itemBuilder: ((context, index) {
                final item = serviceList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 11,
                        backgroundColor: white,
                        foregroundColor: grey,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImageWidget(
                            imageUrl: '${item['img']}',
                          ),
                        ),
                      ),
                      sizeH5,
                      KText(
                        text: '${item['title']}',
                        fontWeight: FontWeight.w600,
                        fontSize: 5,
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  final serviceList = [
    {
      'title': 'Ac Service',
      'img': 'public/uploads/servicecategory/1642589675-category1.png',
    },
    {
      'title': 'Rent a car',
      'img': 'public/uploads/servicecategory/1642589832-category2.jpg',
    },
    {
      'title': 'Cleaning',
      'img': 'public/uploads/servicecategory/1642590180-category3.jpg',
    },
    {
      'title': 'IT Service',
      'img': 'public/uploads/servicecategory/1642590196-category4.webp',
    },
  ];
}
