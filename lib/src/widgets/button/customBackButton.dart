import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/appColors.dart';

customBackButton({IconData? iconData, void Function()? onTap}) =>
    GestureDetector(
      // onLongPress:
      //     onTap == null ? (() => Get.offAll(CustomBottomAppBar())) : () {},
      onTap: onTap != null ? onTap : () => Get.back(),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: CircleAvatar(
          backgroundColor: grey.shade200,
          child: Icon(
            iconData != null ? iconData : Icons.arrow_back_ios_new,
            color: orangeO50,
            size: 20,
          ),
        ),
      ),
    );
