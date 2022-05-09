import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/imageView/imageViewPage.dart';
import 'package:needbox_customer/src/widgets/appBar/customTitleAppBar.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

import '../../animations/loadingAnimation.dart';
import '../../models/category/ServiceDetailsDataModel.dart';
import '../../widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';

class ServiceDetailsDataPage extends StatelessWidget with BaseController {
  final title;
  final slug;
  final id;
  ServiceDetailsDataPage({
    required this.title,
    required this.slug,
    required this.id,
  });
  @override
  Widget build(BuildContext context) {
    serviceDetailsDataC.getServiceDetails(slug, id);
    return Scaffold(
      appBar: backAndTitleAppBar(
        title: '$title',
      ),
      body: FutureBuilder<ServiceDetailsDataModel>(
        future: serviceDetailsDataC.getServiceDetails(slug, id),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return LoadingAnimation();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final item = snapshot.data!;

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(
                      ImageViewPage(
                        image: item.image.toString(),
                        title: title,
                      ),
                    ),
                    child: Container(
                      height: 200,
                      width: Get.width,
                      child: CachedNetworkImageWidget(
                        imageUrl: item.image.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  sizeH20,
                  Padding(
                    padding: paddingH10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          text: item.title.toString(),
                          fontSize: 18,
                        ),
                        sizeH10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KText(
                              text: 'Category: ',
                              fontSize: 12,
                              color: black54,
                            ),
                            KText(
                              text: item.servicecategory!.scatename.toString(),
                              fontSize: 14,
                            ),
                          ],
                        ),
                        sizeH10,
                        Divider(color: orangeO50),
                        sizeH10,
                      ],
                    ),
                  ),
                ],
              );
          }
          return Container();
        }),
      ),
    );
  }
}
