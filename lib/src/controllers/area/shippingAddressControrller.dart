import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/area/shippingAddressModel.dart';
import 'package:needbox_customer/src/widgets/snackBar/customSnackbarWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ShippingAddressController extends GetxController {
  //
  var isLoading = RxBool(false);

  var shipAddressData = ShippingAddressModel().obs;

  shipAddress({
    required name,
    required phone,
    required address,
    required zipCode,
    required stateAddress,
    required houseAddress,
    required districts,
    required area,
  }) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('accessToken');
      final res = await dio.post(
        baseUrl + 'customer/shipping-address',
        data: {
          'name': name,
          'phone': phone,
          'fulladdress': address,
          'district': districts,
          'area': area,
          'stateaddress': stateAddress,
          'houseaddress': houseAddress,
          'zipcode': zipCode,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
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
          message: 'Shipping Address Successfull',
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

  Future<ShippingAddressModel>? getShipAddress() async {
    var _shippingData = await DetailsApiService().fetchApi();

    return shipAddressData.value = _shippingData;
  }
}

class DetailsApiService {
  Future<ShippingAddressModel> fetchApi() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('accessToken');
    var url = baseUrl + 'customer/shipping/address';

    var response = await http
        .get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      var dataResponse = jsonDecode(response.body);

      var data =
          ShippingAddressModel.fromJson(dataResponse['shipping_address']);
      print(dataResponse);
      return data;
    } else {
      throw Exception('Failed Get API');
    }
  }
}
