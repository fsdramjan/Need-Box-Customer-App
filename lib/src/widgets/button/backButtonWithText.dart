import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import '../../configs/appColors.dart';
import '../textWidget/kText.dart';

customBackButtonWithText({String? title, bool? isTitleEnable}) => Row(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: grey.shade200,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: orangeO50,
                size: 20,
              ),
            ),
          ),
        ),
        isTitleEnable == true ? sizeW20 : sizeH10,
        isTitleEnable == true
            ? KText(
                text: '$title',
                fontSize: 17,
                fontWeight: FontWeight.w600,
              )
            : Container(),
      ],
    );
