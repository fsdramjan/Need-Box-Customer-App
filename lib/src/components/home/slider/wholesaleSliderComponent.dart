import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';

import '../../../controllers/MainController/baseController.dart';
import '../../../widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';

class WholesaleSliderComponent extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => sliderListC.wholesaleSliderList.length == 0
          ? Center(child: CircularProgressIndicator())
          : CarouselSlider.builder(
              itemCount: sliderListC.wholesaleSliderList.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                //
                final item = sliderListC.wholesaleSliderList[itemIndex];
                return Stack(
                  children: [
                    Container(
                      height: 150,
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
                height: 150,

                viewportFraction: 1.5,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: sliderListC.wholesaleSliderList.length == 1 ? false : true,
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
