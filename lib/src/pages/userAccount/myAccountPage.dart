import 'package:flutter/material.dart';
import '../../Widgets/button/customBackButton.dart';
import '../../configs/appColors.dart';
import '../../widgets/textWidget/kText.dart';

class MyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'Customer Profile',
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
                  customListTile(
                    height: 50,
                    title: 'Name',
                    contentTitle: 'QuickTech Ramjan',
                  ),
                  customListTile(
                    height: 50,
                    title: 'Email',
                    contentTitle: 'quicktech.ramjan@gmail.com',
                  ),
                  customListTile(
                    height: 50,
                    title: 'Phone Number',
                    contentTitle: '017712821044',
                  ),
                  customListTile(
                    height: 50,
                    title: 'Address',
                    contentTitle: '',
                  ),
                  customListTile(
                    height: 50,
                    title: 'My Point',
                    contentTitle: '0',
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
