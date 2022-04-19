import 'package:flutter/material.dart';

import '../../configs/appColors.dart';

searchFormField() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SizedBox(
        height: 40,
        child: TextFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: grey.shade300,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: grey.shade300,
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
              child: Text(
                'Search',
                style: TextStyle(
                  color: white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
