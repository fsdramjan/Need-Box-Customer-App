import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/controllers/cart/cartController.dart';
import 'package:needbox_customer/src/controllers/orders/orderListController.dart';
import 'package:needbox_customer/src/models/cart/cartModels.dart';
import 'package:needbox_customer/src/pages/home/bottomAppBar.dart';
import 'package:needbox_customer/src/widgets/snackBar/customSnackbarWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/area/shippingAddressModel.dart';

class OrderSaveController extends GetxController {
  createNewOrder({
    required List<CartModels> item,
    required paymentType,
    required totalPrice,
    required districsId,
    required areaId,
    required shippingCharge,
    required Rx<ShippingAddressModel> userInfo,
  }) async {
    try {
      var _data = {
        "cart": item
            .map(
              (e) => {
                "product_id": e.id,
                "product_name": e.productname,
                "sellerid": 1,
                "product_price": e.proNewprice,
                "quantity": e.quantity.toString(),
                "product_size": "",
                "product_color": e.productColor,
              },
            )
            .toList(),
        "name": userInfo.value.name,
        "phone": userInfo.value.phone,
        "district": districsId,
        "area": areaId,
        "stateaddress": userInfo.value.stateaddress,
        "houseaddress": userInfo.value.houseaddress,
        "fulladdress": userInfo.value.fulladdress,
        "zipcode": userInfo.value.zipcode,
        "totalprice": totalPrice,
        "shippingfee": shippingCharge,
        "discount": "",
        "additionalshipping": "",
        "couponcode": "",
        "totalproductpoint": "",
        "usemypoint": "",
        "paymentType": paymentType,
      };

      print(_data);
      final sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('accessToken');
      final res = await dio.post(
        baseUrl + 'customer/order/save',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          "cart": item
              .map(
                (e) => {
                  "product_id": e.id,
                  "product_name": e.productname,
                  "sellerid": 1,
                  "product_price": e.proNewprice,
                  "quantity": e.quantity.toString(),
                  "product_size": "",
                  "product_color": e.productColor,
                },
              )
              .toList(),
          "name": userInfo.value.name,
          "phone": userInfo.value.phone,
          "district": districsId,
          "area": areaId,
          "stateaddress": userInfo.value.stateaddress,
          "houseaddress": userInfo.value.houseaddress,
          "fulladdress": userInfo.value.fulladdress,
          "zipcode": userInfo.value.zipcode,
          "totalprice": totalPrice,
          "shippingfee": shippingCharge,
          "discount": "",
          "additionalshipping": "",
          "couponcode": "",
          "totalproductpoint": "",
          "usemypoint": "",
          "paymentType": paymentType,
        },
      );

      if (res.data['status'] == 'success') {
        snackBarWidget(
          title: 'Success',
          message: 'Order Place Successfully!',
          isRed: false,
        );

        CartController().cartItem.clear();
        Get.offAll(CustomBottomAppBar());
        OrderListController().orderList.clear();
        
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}





// {"cart": [{"product_id": "30", "product_name": "export quality men's fashionable cotton long sleeve shirts", "sellerid": "1", "product_price": "209", "quantity": "1", "product_size":"" , "product_color": "yelow"}], "name": "Rasel Islam Zadu", "phone": "01742892725", "district": "1", "area":" 1", "stateaddress": "4/B", "houseaddress": "33/B", "fulladdress": "Zigatola, Dhanmondi", "zipcode": "1215", "totalprice": "269", "shippingfee": "60", "discount": , "additionalshipping": , "couponcode": , "totalproductpoint": , "usemypoint":"" , "paymentType": "COD"}