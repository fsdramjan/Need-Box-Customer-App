import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/widgets/button/customPrimaryButton.dart';
import 'package:needbox_customer/src/widgets/customFormField/customFormField.dart';
import '../../Widgets/button/customBackButton.dart';
import '../../configs/appColors.dart';
import '../../widgets/textWidget/kText.dart';

class EditProfilePage extends StatelessWidget {
  final nameTextC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'Edit Profile',
          fontSize: 18,
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Container(
            color: white,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Image.asset(
                            'assets/images/avatar.png',
                            scale: 3,
                          ),
                        ),
                      ),
                      Positioned(
                        right: -20,
                        // bottom: 40,
                        child: IconButton(
                          onPressed: () {},
                          icon: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.black26,
                            child: Icon(
                              Icons.add_a_photo,
                              size: 20,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  sizeH30,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(text: 'Full Name: *'),
                      sizeH10,
                      customFormField(
                        height: 50,
                        hintText: 'Name',
                        controller: nameTextC,
                      ),
                      sizeH10,
                      KText(text: 'Phone Number: *'),
                      sizeH10,
                      customFormField(
                        height: 50,
                        hintText: 'Phone Number',
                        controller: nameTextC,
                      ),
                      sizeH10,
                      KText(text: 'Full Address: *'),
                      sizeH10,
                      customFormField(
                        height: 50,
                        hintText: 'Full Address',
                        controller: nameTextC,
                      ),
                      sizeH30,
                      customPrimaryButton(
                        onTap: () {
                          Get.back();

                          Get.snackbar(
                              'Success', 'Profile update successfully!');
                        },
                        color: orangeO50,
                        height: 40,
                        title: 'Save',
                        titleColor: white,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        child: KText(text: ''),
                      ),
                      sizeH10,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  customListTile({
    required double height,
    required String title,
    required String contentTitle,
    bool? isImage,
  }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: grey.shade200,
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            child: Container(
              // width: 130,
              child: KText(
                text: title,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: height,
            width: .7,
            color: grey.shade200,
          ),
          SizedBox(width: 10),
          Expanded(
            child: isImage == true
                ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Image.asset(
                        contentTitle,
                        scale: 3,
                      ),
                    ),
                  )
                : KText(
                    text: contentTitle,
                    fontSize: 14,
                  ),
          ),
        ],
      ),
    );
  }
}
