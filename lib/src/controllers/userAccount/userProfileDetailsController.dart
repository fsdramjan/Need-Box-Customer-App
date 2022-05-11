import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:needbox_customer/src/models/userAccount/userProfileDetailsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../configs/appConfigs.dart';

class UserProfileDetailsController extends GetxController {
  var userProfileInfo = UserProfileDetailsModel().obs;
  //for fetch single data

  Future<UserProfileDetailsModel>? getProfileDetails() async {
    var _profileInfo = await DetailsApiService().fetchApi();
    // print(userProfileInfo);

    return userProfileInfo.value = _profileInfo;
  }
}

class DetailsApiService {
  Future<UserProfileDetailsModel> fetchApi() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('accessToken');
    var url = baseUrl + 'customer/account';

    var response = await http
        .get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      var dataResponse = jsonDecode(response.body);

      var singleProduct =
          UserProfileDetailsModel.fromJson(dataResponse['customer']);
      // print(response.body);

      return singleProduct;
    } else {
      throw Exception('Failed Get API');
    }
  }
}
