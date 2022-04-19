import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../configs/appColors.dart';


customFormField(
        {required double height,
        required String hintText,
        TextInputType? keyboardType,
        required TextEditingController controller}) =>
    SizedBox(
      height: height,
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: grey.shade300,
              width: .9,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: grey.shade300,
              width: .9,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          hintText: hintText,
          hintStyle: GoogleFonts.openSans(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ),
    );
