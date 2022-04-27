import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:needbox_customer/src/models/userAccount/userProfileDetailsModel.dart';
import '../../configs/appConfigs.dart';

class UserProfileDetailsController extends GetxController {
  var userProfileInfo = UserProfileDetailsModel().obs;
  //for fetch single data

  Future<UserProfileDetailsModel>? getProfileDetails() async {
    var _profileInfo = await DetailsApiService().fetchApi();
    print(userProfileInfo);

    return userProfileInfo.value = _profileInfo;
  }
}

class DetailsApiService {
  Future<UserProfileDetailsModel> fetchApi() async {
    var url = baseUrl + 'customer/account';

    var response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbmVlZGJveGJkLnh5elwvYXBpXC92MVwvY3VzdG9tZXJcL2xvZ2luIiwiaWF0IjoxNjUwOTY0NjI4LCJleHAiOjE3Mjk4MDQ2MjgsIm5iZiI6MTY1MDk2NDYyOCwianRpIjoiYktzTzhiZGo1Wm42M250eSIsInN1YiI6MzQsInBydiI6IjhiNDIyZTZmNjU3OTMyYjhhZWJjYjFiZjFlMzU2ZGQ3NmEzNjViZjIifQ.uOO2LLnkgnWdaC8pE-B_D0aAH-yQAQKLFzqQ2XGianY'
    });

    if (response.statusCode == 200) {
      var dataResponse = jsonDecode(response.body);

      var singleProduct = UserProfileDetailsModel.fromJson(dataResponse['customer']);
      print(response.body);

      return singleProduct;
    } else {
      throw Exception('Failed Get API');
    }
  }
}
