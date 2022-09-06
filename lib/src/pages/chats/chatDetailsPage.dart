import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';

import '../../configs/appColors.dart';
import '../../widgets/formField/customFormField.dart';
import '../../widgets/textWidget/kText.dart';

class ChatDetailsPage extends StatelessWidget with BaseController {
  final int? chatId;

  final shopName;
  final shopLogo;
  ChatDetailsPage({
    required this.chatId,
    required this.shopName,
    required this.shopLogo,
  });
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      chatC.chatDetailsList.clear();
      chatC.getChatDetailsList(chatId);
    });
    return Scaffold(
      appBar: AppBar(
        elevation: .8,
        actions: [
          IconButton(
            onPressed: () {
              chatC.getChatDetailsList(chatId);
            },
            icon: Icon(
              Icons.refresh,
              size: 20,
            ),
          ),
        ],
        title: Row(
          children: [
            // CircleAvatar(
            //   backgroundColor: white,
            //   backgroundImage: NetworkImage(
            //     imageBaseUrl +  shoplogo.toString(),
            //   ),
            // ),
            sizeW20,
            KText(
              text: shopName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Obx(
          () => RefreshIndicator(
            color: orangeO50,
            backgroundColor: Colors.transparent,
            onRefresh: () {
              return chatC.getChatDetailsList(chatId);
            },
            child: ListView(
              shrinkWrap: true,
              primary: false,
              reverse: true,
              physics: BouncingScrollPhysics(),
              children: [
                sizeH40,
                sizeH20,
                chatC.isLoading.value == true
                    ? LoadingAnimation()
                    : Container(),
                ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: chatC.chatDetailsList.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (c, i) {
                      var data = chatC.chatDetailsList[i];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: data.isCustomer == null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: white,
                                    // backgroundImage: NetworkImage(
                                    //   imageBaseUrl + item.shoplogo.toString(),
                                    // ),

                                    child: Icon(
                                      Ionicons.person_circle,
                                      size: 40,
                                    ),
                                  ),
                                  sizeW10,
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10,
                                        ),
                                        child: KText(
                                          text: data.message,
                                          textAlign: TextAlign.start,
                                          color: black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  sizeW40,
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  sizeW40,
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: blue,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10,
                                        ),
                                        child: KText(
                                          text: data.message,
                                          textAlign: TextAlign.end,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  sizeW10,
                                  CircleAvatar(
                                      // backgroundColor: white,
                                      // backgroundImage: NetworkImage(
                                      //   imageBaseUrl + item.shoplogo.toString(),
                                      // ),
                                      ),
                                ],
                              ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: BottomAppBar(
        elevation: .7,
        child: Container(
          height: 70,
          width: Get.width,
          alignment: Alignment.center,
          child: Padding(
            padding: paddingH10V10,
            child: customFormField(
              height: null,
              hintText: 'Enter your message',
              titleText: '',
              controller: chatC.messageTextC,
              isFilled: true,
              filledColor: grey.shade300,
              isRemoveTitle: true,
              borderRadius: 30,
              endIcons: IconButton(
                onPressed: () {
                  chatC.sendNewMessage(chatId);
                },
                icon: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.send,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
