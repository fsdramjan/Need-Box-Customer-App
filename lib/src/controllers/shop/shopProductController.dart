import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/shop/shopDetailsModel.dart';

class ShopProductController extends GetxController {
  final shopProduct = RxList<Products>();
  final isLoading = RxBool(false);

  getAllShopProduct({required int? shopId}) async {
    try {
      isLoading.value = true;
      final res = await dio.get(baseUrl + 'vandorshop/$shopId');

      print('------------------------------>');
      print(res.statusCode);
      print(res.headers);
      // print(res.body);
      // print(res.unauthorized);
      print(res.statusMessage);
      print(res.data['products']['data']);
      print(res.data['products']['data'].length);
      print(res.realUri);
      print(res.requestOptions);

      print('++++++++++++++++++++++++++++++++++');
      final List<Products> data = res.data['products']['data']
          .map((json) => Products.fromJson(json))
          .toList()
          .cast<Products>();

      if (res.statusCode == 200) {
        shopProduct.clear();
        shopProduct.addAll(data);
        print(res.data['products']['data']);

        isLoading.value = false;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
