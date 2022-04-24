import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/products/allProductModel.dart';

class AllProductsController extends GetxController {
  final allProductList = RxList<AllProductModel>();
  getAllProduct() async {
    try {
      final res = await dio.get(baseUrl + 'all-product');

      final List<AllProductModel> data = res.data['products']
          .map((json) => AllProductModel.fromJson(json))
          .toList()
          .cast<AllProductModel>();
      if (res.statusCode == 200) {
        allProductList.clear();
        allProductList.addAll(data);
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
