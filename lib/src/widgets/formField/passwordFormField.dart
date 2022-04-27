import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

import '../../configs/appColors.dart';

class PassWordFormField extends StatefulWidget {
  final double height;
  final String hintText;
  final String titleText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final Color? errorBorderColor;
  PassWordFormField({
    required this.height,
    required this.hintText,
    required this.titleText,
    this.keyboardType,
    this.onChanged,
   required this.errorBorderColor,
    required this.controller,
  });

  @override
  State<PassWordFormField> createState() => _PassWordFormFieldState();
}

class _PassWordFormFieldState extends State<PassWordFormField> {
  bool? isShowPassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KText(
          text: widget.titleText,
          color: black,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        sizeH10,
        SizedBox(
          height: widget.height,
          child: TextFormField(
            onChanged: widget.onChanged,
            obscureText: isShowPassword == false ? true : false,
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color:widget.errorBorderColor!=null? widget.errorBorderColor as Color: grey.shade300 ,
                  width: .9,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                                   color: widget.errorBorderColor != null
                      ? widget.errorBorderColor as Color
                      : grey.shade300,

                  width: .9,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  isShowPassword == true
                      ? setState(() {
                          isShowPassword = false;
                        })
                      : setState(() {
                          isShowPassword = true;
                        });

                  print(isShowPassword);
                },
                icon: Icon(
                  isShowPassword != true
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined,
                  size: 20,
                  color: orangeO50,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              hintText: widget.hintText,
              hintStyle: GoogleFonts.openSans(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
