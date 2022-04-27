import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/appConfigs.dart';
import '../../widgets/snackBar/customSnackbarWidget.dart';

class EditProfileController extends GetxController {
  updateProfileInfo({
    required String fullName,
    required String phoneNumber,
    required String address,
  }) async {
    try {
         final sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('accessToken');
      final res = await dio.post(baseUrl + 'customer/profile/update',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
          data: {
            'fullName': fullName,
            'phoneNumber': phoneNumber,
            'address': address,
          });

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
        snackBarWidget(
          title: 'Success!',
          message: 'Profile update successfully',
          isRed: false,
        );
      }
    } catch (e) {
      print('$fullName');
      print('$phoneNumber');
      print('$address');
      print(e);
      snackBarWidget(
        title: 'Opps!',
        message: 'Internal server error ${500}',
        isRed: true,
      );
    }
  }
}
