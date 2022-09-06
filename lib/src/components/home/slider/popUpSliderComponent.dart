import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';

import '../../../controllers/MainController/baseController.dart';
import '../../../widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';

class PopUpSliderComponent extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => sliderListC.isLoading.value == true
          ? LoadingAnimation()
          : sliderListC.popUpSliderList.isEmpty
              ? EmptyAnimation()
              : CarouselSlider.builder(
                  itemCount: sliderListC.popUpSliderList.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    //
                    final item = sliderListC.popUpSliderList[itemIndex];
                    return Stack(
                      children: [
                        Container(
                          height: 290,
                          width: Get.width,
                          child: Padding(
                            padding: paddingH10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImageWidget(
                                imageUrl: item.image.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
            
                      ],
                    );
                  },
                  options: CarouselOptions(
                    height: 290,

                    viewportFraction: 1.5,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay:
                        sliderListC.popUpSliderList.length == 1 ? false : true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  ),
                )),
    );
  }
}
