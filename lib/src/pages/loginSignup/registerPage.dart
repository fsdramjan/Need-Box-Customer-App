// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/pages/loginSignup/loginPage.dart';
 

import '../../Widgets/button/customBackButton.dart';
import '../../configs/appColors.dart';
import '../../widgets/customFormField/customFormField.dart';
import '../../widgets/textWidget/kText.dart';
import '../home/bottomAppBar.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final phoneOrEmailTextC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'Register',
          color: black,
        ),
      ),
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
              // SizedBox(height: 10),
              customFormField(
                height: 55,
                hintText: 'Phone or Email',
                controller: phoneOrEmailTextC,
              ),
              SizedBox(height: 10),
              customFormField(
                height: 55,
                hintText: 'Your Email Address',
                controller: phoneOrEmailTextC,
              ),
              SizedBox(height: 10),
              customFormField(
                height: 55,
                hintText: 'Mobile Number (For order status update)',
                keyboardType: TextInputType.number,
                controller: phoneOrEmailTextC,
              ),
              SizedBox(height: 10),
              customFormField(
                height: 55,
                hintText: 'Your Password',
                controller: phoneOrEmailTextC,
              ),

              SizedBox(height: 30),

              GestureDetector(
                onTap: () => Get.to(CustomBottomAppBar()),
                child: Container(
                  decoration: BoxDecoration(
                    color: orangeO50,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 50,
                  width: Get.width,
                  alignment: Alignment.center,
                  child: KText(
                    text: 'REGISTER',
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KText(
                    text: '''Don't have an account?''',
                    fontWeight: FontWeight.bold,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(LoginPage()),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: KText(
                        text: 'Login',
                        color: darkBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
