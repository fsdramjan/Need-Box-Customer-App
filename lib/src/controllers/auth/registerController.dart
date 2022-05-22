import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/pages/loginSignup/verifyAccountPage.dart';
import 'package:needbox_customer/src/widgets/snackBar/customSnackbarWidget.dart';

class RegisterController extends GetxController {
  //for registration
  final registerFullName = RxString('');
  final registerEmail = RxString('');
  final referralId = RxString('');
  final registerMobileNumber = RxString('');
  final registerPassword = RxString('');

  var isLoading = RxBool(false);

  userRegistration() async {
    try {
      final res = await dio.post(
        baseUrl + 'customer/register',
        data: {
          'fullName': registerFullName.value,
          'phoneNumber': registerMobileNumber.value,
          'email': registerEmail.value,
          'referralId': referralId.value,
          'password': registerPassword.value,
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
      if (res.data['status'] == 'error') {
        snackBarWidget(
          title: res.data['status'],
          message: res.data['message'],
          isRed: true,
        );
      }
      if (res.data['status'] == 'success') {
        Get.to(
          VerifyAccountPage(
            phoneNumber: registerMobileNumber.value,
            referralId: referralId.value,
            verifyPin: res.data['registerinfo']['verifyToken'],
          ),
        );

        snackBarWidget(
          title: 'Success!',
          message: 'Registration Successfull,Please verify your account.',
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
      snackBarWidget(
        title: 'Opps!',
        message: 'Something went wrong!',
        isRed: true,
      );
      print(e);
    }
  }
}
