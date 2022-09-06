import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/pages/chats/chatDetailsPage.dart';

import 'package:needbox_customer/src/widgets/cardWidget/customCardWidget.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

import '../../configs/appConfigs.dart';
import '../../controllers/MainController/baseController.dart';

class ChatListPage extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(text: 'All Message'),
        elevation: .7,
        actions: [
          IconButton(
            onPressed: () {
              chatC.getChatList();
            },
            icon: Icon(
              Icons.refresh,
              size: 20,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: paddingH10,
        child: Obx(
          () => chatC.isLoading.value == true
              ? LoadingAnimation()
              : chatC.chatList.isEmpty
                  ? EmptyAnimation(
                      child: Icon(
                        Ionicons.chatbox_ellipses_outline,
                        size: 100,
                        color: black54,
                      ),
                      title: 'No Message!!',
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: chatC.chatList.length,
                      itemBuilder: (c, i) {
                        var item = chatC.chatList[i];
                        return CustomCardWidget(
                          onTap: () => Get.to(
                            ChatDetailsPage(
                              chatId: item.id,
                              shopLogo: item.shoplogo,
                              shopName: item.shopname,
                            ),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: white,
                              // backgroundImage: NetworkImage(
                              //   imageBaseUrl + item.shoplogo.toString(),
                              // ),
                            ),
                            title: KText(
                              text: item.shopname.toString(),
                              fontSize: 14,
                            ),
                            subtitle: Row(
                              children: [
                                Icon(
                                  Icons.schedule_outlined,
                                  size: 15,
                                ),
                                KText(
                                  text: ' ' +
                                      dateFormat.format(DateTime.parse(
                                          item.updatedAt.toString())) +
                                      ', ' +
                                      timeFormat.format(DateTime.parse(
                                          item.updatedAt.toString())),
                                  color: black54,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
