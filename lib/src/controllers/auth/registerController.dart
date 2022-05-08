import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/pages/home/bottomAppBar.dart';
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
      if (res.data['error'] == 'validation_error') {
        snackBarWidget(
          title: 'Opps!',
          message: 'Validation Error ${res.statusCode}',
          isRed: true,
        );
      }
      if (res.data['status'] == 'success') {
        Get.offAll(CustomBottomAppBar());

        snackBarWidget(
          title: 'Success!',
          message: 'User Registration Successfull',
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
}
