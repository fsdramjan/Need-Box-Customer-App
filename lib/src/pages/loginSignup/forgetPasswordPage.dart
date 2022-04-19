// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widgets/button/customBackButton.dart';
import '../../configs/appColors.dart';
import '../../widgets/customFormField/customFormField.dart';
import '../../widgets/textWidget/kText.dart';

class ForgetPasswordPage extends StatelessWidget {
  final phoneOrEmailTextC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'Forget Password',
          color: black,
        ),
      ),
      backgroundColor: white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              // SizedBox(height: 30),
              Container(
                height: 200,
                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 90),
                  child: Image.asset(
                    'assets/images/banner.png',
                    fit: BoxFit.cover,
                    // scale: 3,
                  ),
                ),
              ),
              KText(
                text: 'Phone Number',
                color: black,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 10),
//
              customFormField(
                keyboardType: TextInputType.number,
                height: 55,
                hintText: 'Phone',
                controller: phoneOrEmailTextC,
              ),

              SizedBox(height: 30),

              Container(
                decoration: BoxDecoration(
                  color: orangeO50,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 50,
                width: Get.width,
                alignment: Alignment.center,
                child: KText(
                  text: 'SUBMIT',
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
