import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';

import '../../Widgets/button/customBackButton.dart';

class ImageViewPage extends StatelessWidget {
  final String image;

  ImageViewPage({
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
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
