import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/models/userAccount/userProfileDetailsModel.dart';
import 'package:needbox_customer/src/pages/imageView/imageViewPage.dart';
import '../../Widgets/button/customBackButton.dart';
import '../../animations/loadingAnimation.dart';
import '../../configs/appColors.dart';
import '../../widgets/textWidget/kText.dart';

class MyAccountPage extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'Customer Profile',
          fontSize: 16,
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          FutureBuilder<UserProfileDetailsModel>(
              future: userProfileDetailsC.getProfileDetails(),
              builder: ((context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    break;
                  case ConnectionState.waiting:
                    return LoadingAnimation();
                  case ConnectionState.active:
                    break;
                  case ConnectionState.done:
                    final item = snapshot.data!;
                    return Container(
                      color: white,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => Get.to(
                                ImageViewPage(
                                  image: item.image.toString(),
                                  title: item.fullName.toString(),
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundColor: white,
                                radius: 40,
                                backgroundImage: NetworkImage(
                                  imageBaseUrl + item.image.toString(),
                                ),
                              ),
                            ),
                            sizeH20,
                            customListTile(
                              height: 50,
                              title: 'Name',
                              contentTitle: item.fullName == null
                                  ? ''
                                  : item.fullName.toString(),
                            ),
                            customListTile(
                              height: 50,
                              title: 'Email',
                              contentTitle: item.email == null
                                  ? ''
                                  : item.email.toString(),
                            ),
                            customListTile(
                              height: 50,
                              title: 'Phone Number',
                              contentTitle: item.phoneNumber == null
                                  ? ''
                                  : item.phoneNumber.toString(),
                            ),
                            customListTile(
                              height: 50,
                              title: 'Address',
                              contentTitle: item.address == null
                                  ? ''
                                  : item.address.toString(),
                            ),
                            customListTile(
                              height: 50,
                              title: 'My Point',
                              contentTitle: item.mypoint.toString(),
                            ),
                            customListTile(
                              height: 50,
                              title: 'Referral Id',
                              contentTitle: item.referralId == null
                                  ? '-'
                                  : item.referralId.toString(),
                            ),
                          ],
                        ),
                      ),
                    );
                }
                return Container();
              }))
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
