import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/orders/orderListModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderListController extends GetxController {
  final orderList = RxList<OrderListModel>();
  final isLoading = RxBool(false);
  getAllOrders() async {
    try {
      isLoading.value = true;
      final sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('accessToken');
      final res = await dio.get(
        baseUrl + 'customer/order',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final List<OrderListModel> data = res.data['customerorders']
          .map((json) => OrderListModel.fromJson(json))
          .toList()
          .cast<OrderListModel>();
      if (res.statusCode == 200) {
        orderList.clear();
        orderList.addAll(data);
        isLoading.value = false;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
