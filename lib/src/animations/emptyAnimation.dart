import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

class EmptyAnimation extends StatelessWidget {
  final double? height;
  final double? width;
  final String? title;
  final String? twoTitle;

  final Widget? child;

  EmptyAnimation({
    this.height,
    this.width,
    this.title,
    this.twoTitle,
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          child == null
              ? Lottie.asset(
                  'assets/animations/empty.json',
                  height: height != null ? height : 300,
                  width: width,
                )
              : child as Widget,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              KText(
                text: title != null ? title.toString() : 'There is no product!',
                color: black54,
              ),
              KText(
                text: twoTitle != null ? twoTitle.toString() : '',
                color: black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
