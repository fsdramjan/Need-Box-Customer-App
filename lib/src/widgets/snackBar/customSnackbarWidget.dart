import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/appColors.dart';

snackBarWidget({
  required String? title,
  required String? message,
  required bool? isRed,
  bool? isShowSnackbar,
}) {
  return isShowSnackbar == null
      ? isRed == false
          ? Get.snackbar(
              title.toString(),
              message.toString(),
              backgroundColor: green,
              mainButton: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.close,
                    size: 15,
                    color: white,
                  )),
              icon: Icon(
                Icons.check,
                color: white,
                size: 20,
              ),
              colorText: white,
              snackPosition: SnackPosition.BOTTOM,
            )
          : Get.snackbar(
              title.toString(),
              message.toString(),
              backgroundColor: orangeO50,
              colorText: white,
              mainButton: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.close,
                    size: 15,
                    color: white,
                  )),
              icon: Icon(
                Icons.close,
                color: white,
                size: 20,
              ),
              snackPosition: SnackPosition.BOTTOM,
            )
      : Container();
}
