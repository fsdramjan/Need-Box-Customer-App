import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';
import '../../configs/appColors.dart';

Widget customFormField({
  required double? height,
  required String hintText,
  required String titleText,
  Color? errorBorderColor,
  TextInputType? keyboardType,
  required TextEditingController controller,
  void Function(String)? onChanged,
  bool? isStarEnable,
  bool? isRemoveTitle,
  bool? isFilled,
  Color? filledColor,
  double? borderRadius,
  Widget? endIcons,
}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isRemoveTitle == true
                ? Container()
                : KText(
                    text: titleText,
                    color: black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
            isStarEnable == true
                ? KText(
                    text: ' *',
                    color: black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  )
                : Container(),
          ],
        ),
        isRemoveTitle == true ? sizeW10 : sizeH10,
        SizedBox(
          height: height,
          child: TextFormField(
            onChanged: onChanged,
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    borderRadius == null ? 5 : borderRadius),
                borderSide: BorderSide(
                  color: errorBorderColor != null
                      ? errorBorderColor
                      : grey.shade300,
                  width: .9,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    borderRadius == null ? 5 : borderRadius),
                borderSide: BorderSide(
                  color: errorBorderColor != null
                      ? errorBorderColor
                      : grey.shade300,
                  width: .9,
                ),
              ),
              suffixIcon: endIcons,
              filled: isFilled,
              fillColor: filledColor,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              hintText: hintText,
              hintStyle: GoogleFonts.openSans(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ],
    );
