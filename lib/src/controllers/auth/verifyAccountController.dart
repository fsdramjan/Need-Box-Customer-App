import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/pages/loginSignup/loginPage.dart';
import 'package:needbox_customer/src/widgets/snackBar/customSnackbarWidget.dart';

class VerifyAccountController extends GetxController {
  final verifyPin = RxString('');
  //

  userAccountVerify({
    required phoneNumber,
    required referralId,
  }) async {
    try {
      final res = await dio.post(
        baseUrl + 'customer/verify',
        data: {
          'phoneNumber': phoneNumber,
          'verifyPin': verifyPin.value,
          'referralId': referralId,
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

      if (res.data['status'] == 'success') {
        Get.offAll(LoginPage());
        snackBarWidget(
          title: 'Success!',
          message: 'User Registration Successfull, Please login',
          isRed: false,
        );
      }
      if (res.data['status'] == 'faild') {
        snackBarWidget(
          title: 'Opps!',
          message: res.data['message'],
          isRed: true,
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
               snackBarWidget(
        title: 'Opps!',
        message: 'Something went wrong!',
        isRed: true,
      );
    }
  }
}
