import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

class EmptyAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/empty.json',
            height: 300,
          ),
          KText(
            text: 'There is no product!',
            color: black54,
          ),
        ],
      ),
    );
  }
}
