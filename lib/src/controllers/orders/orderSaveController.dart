import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/controllers/cart/cartController.dart';
import 'package:needbox_customer/src/controllers/orders/orderListController.dart';
import 'package:needbox_customer/src/models/cart/cartModels.dart';
import 'package:needbox_customer/src/pages/home/bottomAppBar.dart';
import 'package:needbox_customer/src/widgets/snackBar/customSnackbarWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/userAccount/userProfileDetailsModel.dart';

class OrderSaveController extends GetxController {
  createNewOrder({
    required CartModels item,
    required paymentType,
    required totalPrice,
    required districsId,
    required areaId,
    required shippingCharge,
    
    required UserProfileDetailsModel userInfo,
  }) async {
    try {
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
          "cart":

              //  item
              //     .map((product) => {
              //              "product_id": product['id'],
              //           "product_name": product['productname'],
              //           "sellerid": 1,
              //           "product_price": product['proNewprice'],
              //           "quantity": product['quantity'],
              //           "product_size": "",
              //           "product_color": product['productColor'],
              //         })
              //     .toList()

              [
            {
              "product_id": item.id,
              "product_name": item.productname,
              "sellerid": 1,
              "product_price": item.proNewprice,
              "quantity": item.quantity.toString(),
              "product_size": "",
              "product_color": item.productColor,
            },
          ],
          "name": userInfo.fullName,
          "phone": userInfo.phoneNumber,
          "district": districsId,
          "area":areaId,
          "stateaddress": "Road, 4/a",
          "houseaddress": "Mirpur, Dhaka",
          "fulladdress": userInfo.address,
          "zipcode": "1212",
          "totalprice": totalPrice,
          "shippingfee": shippingCharge,
          "discount": "",
          "additionalshipping": "",
          "couponcode": "",
          "totalproductpoint": "",
          "usemypoint": "",
          "paymentType": paymentType,
        },
        //   data: OrderSaveModel(
        //     cart: [
        //       CartItem(
        //         productId: item.id,
        //         productName: item.productname,
        //         sellerid: 1,
        //         productPrice: item.proNewprice,
        //         quantity: item.quantity.toInt(),
        //         productSize: '',
        //         productColor: item.productColor,
        //       ),
        //     ],
        //     name: userInfo.fullName,
        //     phone: userInfo.phoneNumber,
        //     district: '',
        //     area: '',
        //     stateaddress: '',
        //     houseaddress: '',
        //     fulladdress: userInfo.address,
        //     zipcode: '',
        //     totalprice: '${CartController().totalsAmount}',
        //     shippingfee: '${CartController().shippingFee}',
        //     discount: '',
        //     additionalshipping: '',
        //     couponcode: '',
        //     totalproductpoint: '',
        //     usemypoint: '',
        //     paymentType: paymentType,
        //   ),
      );

      if (res.statusCode == 200) {
        snackBarWidget(
          title: 'Success',
          message: 'Order Place Successfully!',
          isRed: false,
        );
        print('Total Order:-');
        print(totalPrice);
        print('Order ID:-');
        print(res.data['order']['ordertrack']);

        CartController().cartItem.clear();
        Get.offAll(CustomBottomAppBar());
        OrderListController().orderList.clear();
        // return res;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
