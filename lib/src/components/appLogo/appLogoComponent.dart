import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';

class AppLogoComponent extends StatelessWidget with BaseController {
  final double? height;
  final double? width;

  AppLogoComponent({
    this.height,
    this.width,
  });

 

  @override
  Widget build(BuildContext context) {
    
    return Obx(
      () => appLogoC.appLogo.isEmpty
          ? LoadingAnimation()
          : ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 1,
            itemBuilder: ((context, index) {
              final item = appLogoC.appLogo[index];
              return Container(
                height: height != null ? height : 200,
                width: width,
                child: CachedNetworkImageWidget(
                  imageUrl: item.logo.toString(),
                ),
              );
            }),
          ),
    );
  }
}
