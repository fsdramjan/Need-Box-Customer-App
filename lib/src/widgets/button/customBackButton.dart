import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/appColors.dart';

customBackButton() => GestureDetector(
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
    );
