// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/loginSignup/loginPage.dart';
import 'package:needbox_customer/src/widgets/formField/passwordFormField.dart';
import 'package:needbox_customer/src/widgets/snackBar/customSnackbarWidget.dart';

import '../../Widgets/button/customBackButton.dart';
import '../../components/appLogo/appLogoComponent.dart';
import '../../configs/appColors.dart';
import '../../widgets/formField/customFormField.dart';
import '../../widgets/textWidget/kText.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with BaseController {
  final fullNameTextC = TextEditingController();
  final phoneOrEmailTextC = TextEditingController();
  final emailTextC = TextEditingController();
  final referralIdTextC = TextEditingController();
  final passwordTextC = TextEditingController();

  var isFormEmpty = false;

  @override
  Widget build(BuildContext context) {
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
          child: Obx(
            () => userRegisterC.isLoading.value != false
                ? Container()
                : ListView(
                    children: [
                      AppLogoComponent(),
                      customFormField(
                        height: 55,
                        hintText: 'Full Name',
                        controller: fullNameTextC,
                        onChanged: userRegisterC.registerFullName,
                        errorBorderColor: isFormEmpty == true
                            ? userRegisterC.registerFullName.value.isEmpty
                                ? red
                                : null
                            : null,
                        titleText: 'Full Name',
                      ),
                      SizedBox(height: 10),
                      customFormField(
                        height: 55,
                        hintText: 'Mobile Number (For order status update)',
                        keyboardType: TextInputType.number,
                        onChanged: userRegisterC.registerMobileNumber,
                        titleText: 'Mobile Number',
                        errorBorderColor: isFormEmpty == true
                            ? userRegisterC.registerMobileNumber.value.isEmpty
                                ? red
                                : null
                            : null,
                        controller: phoneOrEmailTextC,
                      ),
                      SizedBox(height: 10),
                      customFormField(
                        height: 55,
                        hintText: 'Your Email Address',
                        controller: emailTextC,
                        onChanged: userRegisterC.registerEmail,
                        errorBorderColor: isFormEmpty == true
                            ? userRegisterC.registerEmail.value.isEmpty
                                ? red
                                : null
                            : null,
                        titleText: 'Email',
                      ),
                      SizedBox(height: 10),
                      customFormField(
                        height: 55,
                        hintText: 'Referral ID',
                        controller: referralIdTextC,
                        onChanged: userRegisterC.referralId,
                        errorBorderColor: isFormEmpty == true
                            ? userRegisterC.referralId.value.isEmpty
                                ? red
                                : null
                            : null,
                        titleText: 'Enter Referral ID (optional)',
                      ),
                      SizedBox(height: 10),
                      PassWordFormField(
                        height: 55,
                        hintText: 'Your Password',
                        onChanged: userRegisterC.registerPassword,
                        controller: passwordTextC,
                        errorBorderColor: isFormEmpty == true
                            ? userRegisterC.registerPassword.value.isEmpty
                                ? red
                                : null
                            : null,
                        titleText: 'Password',
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFormEmpty = true;
                          });
                          if (passwordTextC.text.isEmpty ||
                              fullNameTextC.text.isEmpty ||
                              emailTextC.text.isEmpty ||
                              phoneOrEmailTextC.text.isEmpty) {
                            snackBarWidget(
                              title: 'Opps!',
                              message: 'Field Empty',
                              isRed: true,
                            );
                          } else {
                            userRegisterC.userRegistration();
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: orangeO50,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: 40,
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
                            fontSize: 14,
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
      ),
    );
  }
}
