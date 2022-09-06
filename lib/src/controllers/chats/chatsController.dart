import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/chats/chatDetailsModel.dart';
import 'package:needbox_customer/src/models/chats/chatListModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatsController extends GetxController {
  final chatList = RxList<ChatListModel>();
  final chatDetailsList = RxList<ChatDetailsModel>();

  var messageTextC = TextEditingController();

  var isLoading = RxBool(false);
  var _dio = Dio();

  getChatList() async {
    try {
      isLoading.value = true;

      final sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('accessToken');
      final res = await _dio.get(
        baseUrl + 'customer/chat',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      List<ChatListModel> data = res.data['chatlist']
          .map((json) => ChatListModel.fromJson(json))
          .toList()
          .cast<ChatListModel>();

      if (res.statusCode == 200) {
        chatList.clear();
        chatList.addAll(data);

        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }

  getChatDetailsList(chatId) async {
    try {
      isLoading.value = true;

      final sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('accessToken');
      final res = await _dio.get(
        baseUrl + 'customer/chat-with-seller/$chatId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      List<ChatDetailsModel> data = res.data['cmessages']
          .map((json) => ChatDetailsModel.fromJson(json))
          .toList()
          .cast<ChatDetailsModel>();

      if (res.statusCode == 200) {
        chatDetailsList.clear();
        chatDetailsList.addAll(data);

        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }

  sendNewMessage(sellerId) async {
    try {
      isLoading.value = true;

      final sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('accessToken');

      final res = await _dio.post(
        baseUrl + 'customer/to/seller/message',
        data: {
          'sellerId': sellerId,
          'message': messageTextC.text,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (res.data != null) {
        messageTextC.clear();

        getChatDetailsList(sellerId);
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }
}
