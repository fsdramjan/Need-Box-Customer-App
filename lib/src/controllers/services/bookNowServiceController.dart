import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/widgets/snackBar/customSnackbarWidget.dart';

class BookNowServiceController extends GetxController {
  //
  var isLoading = RxBool(false);

  bookNow({
    required id,
    required name,
    required email,
    required phone,
    required address,
  }) async {
    try {
      final res = await dio.post(
        baseUrl + 'customer/service/request',
        data: {
          'service_id': id,
          'name': name,
          'phone': phone,
          'email': email,
          'address': address,
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
        Get.back();
        snackBarWidget(
          title: 'Success!',
          message: 'Book Now Successfull',
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
      snackBarWidget(
        title: 'Opps!',
        message: 'Something went wrong!',
        isRed: true,
      );
    }
  }
}
