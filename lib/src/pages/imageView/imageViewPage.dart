import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

import '../../Widgets/button/customBackButton.dart';

class ImageViewPage extends StatelessWidget {
  final String image;
  final String? title;

  ImageViewPage({
    required this.image,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: title == null ? '' : title.toString(),
          fontSize: 16,
        ),
      ),
      body: CachedNetworkImageWidget(
        height: Get.height,
        width: Get.width,
        fit: BoxFit.contain,
        imageUrl: image,
      ),
    );
  }
}
