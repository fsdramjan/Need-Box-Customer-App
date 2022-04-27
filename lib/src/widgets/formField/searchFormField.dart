import 'package:flutter/material.dart';

import '../../configs/appColors.dart';
import '../textWidget/kText.dart';

searchFormField({
  bool? isFormEnable,
  void Function()? onTap,
}) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SizedBox(
        height: 40,
        child: TextFormField(
          onTap: onTap,
          readOnly: isFormEnable == true ? false : true,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: orangeO50,
                width: .5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: orangeO50,
                width: .5,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            hintText: 'Search Product By Name...',
            hintStyle: TextStyle(
              fontSize: 13,
              color: grey.shade400,
            ),
            suffixIcon: Container(
              width: 80,
              decoration: BoxDecoration(
                  color: orangeO50,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              alignment: Alignment.center,
              child: KText(
                text: 'Search',
                fontSize: 14,
                color: white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
