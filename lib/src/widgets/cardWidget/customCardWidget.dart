import 'package:flutter/material.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final void Function()? onTap;

  CustomCardWidget({
    required this.child,
    this.onTap,
    this.padding,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: padding,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadiusC10,
            border: Border.all(
              color: grey.shade200,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
