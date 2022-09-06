import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/controllers/slider/sliderController.dart';

import '../cachedNetworkImage/cachedNetworkImageWidget.dart';

Widget homePopupDialog(BuildContext context, bool? isHidePopUps) {
  var sliderListC = Get.put(SliderController());
  return SimpleDialog(
    contentPadding: EdgeInsets.zero,
    backgroundColor: white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    children: [
      Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Obx(
              () => sliderListC.isLoading.value == true
                  ? LoadingAnimation()
                  : CachedNetworkImageWidget(
                      imageUrl: sliderListC.popUpSliderList[0].image.toString(),
                      fit: BoxFit.cover,
                      height: Get.height / 1.7,
                      width: Get.width,
                    ),
            ),
          ),
          Positioned(
            top: -10,
            right: -10,
            child: GestureDetector(
              onTap: () {
                isHidePopUps = true;

                Get.back();
              },
              child: CircleAvatar(
                radius: 15,
                backgroundColor: white,
                child: Icon(
                  Icons.close,
                  size: 15,
                  color: orangeO50,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
