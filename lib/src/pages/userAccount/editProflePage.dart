// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/controllers/userAccount/userProfileUpload.dart';
import 'package:needbox_customer/src/widgets/button/customPrimaryButton.dart';

import 'package:needbox_customer/src/widgets/formField/customFormField.dart';
import '../../Widgets/button/customBackButton.dart';
import '../../configs/appColors.dart';
import '../../configs/appConfigs.dart';
import '../../models/userAccount/userProfileDetailsModel.dart';
import '../../widgets/snackBar/customSnackbarWidget.dart';
import '../../widgets/textWidget/kText.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  final UserProfileDetailsModel userInfo;
  EditProfilePage({
    required this.userInfo,
  });
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> with BaseController {
  final nameTextC = TextEditingController();
  final phoneTextC = TextEditingController();
  final fullAddressTextC = TextEditingController();
  @override
  void initState() {
    nameTextC.text = widget.userInfo.fullName == null
        ? ''
        : widget.userInfo.fullName.toString();
    phoneTextC.text = widget.userInfo.phoneNumber == null
        ? ''
        : widget.userInfo.phoneNumber.toString();
    fullAddressTextC.text = widget.userInfo.address == null
        ? ''
        : widget.userInfo.address.toString();

    super.initState();
  }

  //for image upload
  File? image;
  final pickImage = ImagePicker();
  var isUploading = false;

  Future getImage() async {
    PickedFile? pickedFile =
        await pickImage.getImage(source: ImageSource.gallery);
    var imageFile = File(pickedFile!.path);

    if (imageFile.path.isNotEmpty) {
      setState(() {
        isUploading = true;
      });
      print('upload started');
      var res1 = await UserProfileUpload()
          .sendForm(baseUrl + 'customer/profile/update', {
        "id": widget.userInfo.id,
        "fullName": widget.userInfo.fullName,
        "phoneNumber": widget.userInfo.phoneNumber,
        "address": widget.userInfo.address,
      }, {
        "image": imageFile
      });
      print("res-1 $res1");

      snackBarWidget(
          title: 'Success', message: 'Image uploaded.', isRed: false);

      setState(() {
        image = imageFile;
      });
      setState(() {
        isUploading = false;
      });
    } else {
      snackBarWidget(
          title: 'Opps!', message: 'Image upload failed.', isRed: true);
    }
  }

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
                          border: Border.all(
                            color: grey.shade100,
                            width: .5,
                          ),
                        ),
                        child: isUploading == true
                            ? LoadingAnimation()
                            : image != null
                                ? CircleAvatar(
                                    radius: 45,
                                    backgroundColor: white,
                                    backgroundImage: FileImage(
                                      image as File,
                                    ),
                                    // child: Image.file(
                                    //   image as File,
                                    //   fit: BoxFit.cover,
                                    // ),
                                  )
                                : CircleAvatar(
                                    radius: 45,
                                    backgroundColor: white,
                                    backgroundImage: NetworkImage(
                                      imageBaseUrl +
                                          widget.userInfo.image.toString(),
                                    ),
                                  ),
                      ),
                      Positioned(
                        right: -20,

                        // bottom: 40,
                        child: isUploading == true
                            ? Container()
                            : IconButton(
                                onPressed: getImage,
                                icon: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.black26,
                                  child: Icon(
                                    Icons.add_a_photo,
                                    size: 15,
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
                      sizeH10,
                      customFormField(
                        height: 50,
                        hintText: 'Name',
                        controller: nameTextC,
                        titleText: 'Name',
                      ),
                      sizeH10,
                      customFormField(
                        height: 50,
                        controller: phoneTextC,
                        hintText: 'Phone Number',
                        titleText: 'Phone Number',
                      ),
                      sizeH10,
                      customFormField(
                        height: 50,
                        hintText: 'Full Address',
                        controller: fullAddressTextC,
                        titleText: 'Full Address',
                      ),
                      sizeH30,
                      customPrimaryButton(
                        onTap: () {
                          if (nameTextC.text.isEmpty ||
                              phoneTextC.text.isEmpty ||
                              fullAddressTextC.text.isEmpty) {
                            snackBarWidget(
                              title: 'Opps!',
                              message: 'Field Empty!',
                              isRed: true,
                            );
                          } else {
                            Get.back();
                            userProfileUpdateC.updateProfileInfo(
                              fullName: nameTextC.text,
                              phoneNumber: phoneTextC.text,
                              address: fullAddressTextC.text,
                            );
                          }
                          nameTextC.clear();
                          phoneTextC.clear();
                          fullAddressTextC.clear();
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
