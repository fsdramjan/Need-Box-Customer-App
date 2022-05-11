// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import '../../Widgets/button/customBackButton.dart';
import '../../components/appLogo/appLogoComponent.dart';
import '../../configs/appColors.dart';
import '../../widgets/formField/customFormField.dart';
import '../../widgets/snackBar/customSnackbarWidget.dart';
import '../../widgets/textWidget/kText.dart';

class VerifyAccountPage extends StatefulWidget {
  final phoneNumber;
  final referralId;
  final verifyPin;

  VerifyAccountPage({
    required this.verifyPin,
    required this.phoneNumber,
    required this.referralId,
  });

  @override
  State<VerifyAccountPage> createState() => _VerifyAccountPageState();
}

class _VerifyAccountPageState extends State<VerifyAccountPage>
    with BaseController {
  final otpVerification = TextEditingController();

  @override
  void initState() {
    otpVerification.text =
        widget.verifyPin == null ? '' : '${widget.verifyPin}'.toString();
    super.initState();
  }

  var isFormEmpty = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'Account Verification',
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
              AppLogoComponent(),
              customFormField(
                height: 55,
                hintText: 'Pin Number',
                keyboardType: TextInputType.number,
                controller: otpVerification,
                onChanged: verifyAccountC.verifyPin,
                titleText: 'Enter Pin Number',
              ),

              SizedBox(height: 30),

              GestureDetector(
                onTap: () async {
                  setState(() {
                    isFormEmpty = true;
                  });
                  if (otpVerification.text.isEmpty) {
                    snackBarWidget(
                      title: 'Opps!',
                      message: 'Field Empty',
                      isRed: true,
                    );
                  } else {
                    await verifyAccountC.userAccountVerify(
                      phoneNumber: widget.phoneNumber,
                      referralId: widget.referralId,
                    );
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
                    text: 'SUBMIT',
                    color: white,
                    fontWeight: FontWeight.bold,
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
