// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/pages/loginSignup/registerPage.dart';

import '../../configs/appColors.dart';
import '../../widgets/button/customPrimaryButton.dart';
import '../../widgets/customFormField/customFormField.dart';
import '../../widgets/textWidget/kText.dart';
import 'forgetPasswordPage.dart';
import '../home/bottomAppBar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneOrEmailTextC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // SizedBox(height: 10),
              customFormField(
                height: 55,
                hintText: 'Phone or Email',
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
                    text: 'LOGIN',
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: customPrimaryButton(
                      color: darkBlue,
                      height: 50,
                      isChildEnable: true,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.facebook,
                            size: 20,
                            color: white,
                          ),
                          SizedBox(width: 5),
                          KText(
                            text: 'Facebook',
                            color: white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: customPrimaryButton(
                      color: orangeO50,
                      height: 50,
                      isChildEnable: true,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.email,
                            size: 20,
                            color: white,
                          ),
                          SizedBox(width: 5),
                          KText(
                            text: 'Gmail',
                            color: white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                    onTap: () => Get.to(RegisterPage()),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: KText(
                        text: 'Sign up',
                        color: darkBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              GestureDetector(
                onTap: () => Get.to(ForgetPasswordPage()),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: KText(
                      text: 'Forget Password?',
                      color: darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
