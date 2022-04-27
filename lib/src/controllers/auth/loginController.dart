import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/pages/home/bottomAppBar.dart';
import 'package:needbox_customer/src/widgets/snackBar/customSnackbarWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/loginSignup/loginPage.dart';

class LoginController extends GetxController {
  final loginPhoneOrEmail = RxString('');
  final loginPassword = RxString('');
  //
  var isLoading = RxBool(false);

  userLogin() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();

      final res = await dio.post(
        baseUrl + 'customer/login',
        data: {
          'phoneNumber': loginPhoneOrEmail.value,
          'password': loginPassword.value,
        },
      );
      print('<------------------------------');
      print(res.statusCode);
      print(res.headers);
      print(res.realUri);
      print(res.statusMessage);
      print(res.data);
      print(res.realUri);
      print(res.requestOptions);
      print('------------------------------>');
      if (res.data['error'] == 'validation_error') {
        snackBarWidget(
          title: 'Opps!',
          message: 'Validation Error ${res.statusCode}',
          isRed: true,
        );
      }
      if (res.statusCode == 200) {
        print('Current user Access Token : ${res.data['token']}');
        sharedPreferences.setString(
          'accessToken',
          res.data['token'],
        );
        Get.offAll(CustomBottomAppBar());
        snackBarWidget(
          title: 'Success!',
          message: 'User Login Successfull',
          isRed: false,
        );
      }

      if (res.statusCode == 500) {
        snackBarWidget(
          title: 'Opps!',
          message: 'Internal Server error ${res.statusCode}',
          isRed: true,
        );
      }
    } catch (e) {
      print(e);
    }
  }
    userSignOut() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('accessToken');
  
    Get.offAll(LoginPage());
  }
}
