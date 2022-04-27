import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimation extends StatelessWidget {
  final double? height;
  final double? width;

  LoadingAnimation({
      this.height,
      this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/animations/loading.json',
        height:height!=null? height: 100,
        width: width,
      ),
    );
  }
}
