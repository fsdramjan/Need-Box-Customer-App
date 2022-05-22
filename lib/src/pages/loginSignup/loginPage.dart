// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/components/appLogo/appLogoComponent.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/pages/home/bottomAppBar.dart';
import 'package:needbox_customer/src/pages/loginSignup/registerPage.dart';
import 'package:needbox_customer/src/widgets/appBar/customTitleAppBar.dart';
import 'package:needbox_customer/src/widgets/formField/passwordFormField.dart';

import '../../configs/appColors.dart';
import '../../widgets/formField/customFormField.dart';
import '../../widgets/snackBar/customSnackbarWidget.dart';
import '../../widgets/textWidget/kText.dart';
import 'forgetPasswordPage.dart';

class LoginPage extends StatefulWidget {
  final bool? isBackEnable;

  LoginPage({
    this.isBackEnable,
  });
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with BaseController {
  final phoneOrEmailTextC = TextEditingController();
  final passwordTextC = TextEditingController();
  var isFormEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAndTitleAppBar(
        title: '',
        onTap: () => Get.offAll(
          CustomBottomAppBar(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Obx(
            () => userLoginC.isLoading.value != false
                ? Container() 
                : ListView(
                    children: [
                      AppLogoComponent(),
                      customFormField(
                        height: 55,
                        hintText: 'Phone or Email',
                        titleText: 'Phone or Email',
                        onChanged: userLoginC.loginPhoneOrEmail,
                        controller: phoneOrEmailTextC,
                        errorBorderColor: isFormEmpty == true
                            ? phoneOrEmailTextC.text.isEmpty ||
                                    userLoginC.loginPhoneOrEmail.value.isEmpty
                                ? red
                                : null
                            : null,
                      ),
                      SizedBox(height: 10),
                      PassWordFormField(
                        errorBorderColor: isFormEmpty == true
                            ? passwordTextC.text.isEmpty ||
                                    userLoginC.loginPassword.value.isEmpty
                                ? red
                                : null
                            : null,
                        onChanged: userLoginC.loginPassword,
                        height: 55,
                        hintText: 'Your Password',
                        controller: passwordTextC,
                        titleText: 'Password',
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFormEmpty = true;
                            print(isFormEmpty);
                          });
                          if (passwordTextC.text.isEmpty ||
                              phoneOrEmailTextC.text.isEmpty) {
                            snackBarWidget(
                              title: 'Opps!',
                              message: 'Field Empty',
                              isRed: true,
                            );
                          } else {
                            userLoginC.userLogin();
                            userProfileDetailsC.getProfileDetails();
                            allOrderListC.getAllOrders();
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
                            text: 'LOGIN',
                            color: white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // SizedBox(height: 20),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: customPrimaryButton(
                      //         color: darkBlue,
                      //         height: 40,
                      //         isChildEnable: true,
                      //         child: Row(
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Icon(
                      //               Icons.facebook,
                      //               size: 20,
                      //               color: white,
                      //             ),
                      //             SizedBox(width: 5),
                      //             KText(
                      //               text: 'Facebook',
                      //               color: white,
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(width: 10),
                      //     Expanded(
                      //       child: customPrimaryButton(
                      //         color: orangeO50,
                      //         height: 50,
                      //         isChildEnable: true,
                      //         child: Row(
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Icon(
                      //               Icons.email,
                      //               size: 20,
                      //               color: white,
                      //             ),
                      //             SizedBox(width: 5),
                      //             KText(
                      //               text: 'Gmail',
                      //               color: white,
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
      ),
    );
  }
}
