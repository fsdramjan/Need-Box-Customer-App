import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/products/wholeSaleProductModel.dart';
 

class WholesaleProductController extends GetxController {
  final wholeSaleProductList = RxList<WholeSaleProductModel>();

  var isLoading = RxBool(false);
  getWholesaleProduct() async {
    try {
      isLoading.value = true;
      final res = await dio.get(baseUrl + 'wholesale/product');

      final List<WholeSaleProductModel> data = res.data['products']['data']
          .map((json) => WholeSaleProductModel.fromJson(json))
          .toList()
          .cast<WholeSaleProductModel>();
      if (res.statusCode == 200) {
        wholeSaleProductList.clear();
        wholeSaleProductList.addAll(data);
        // print(wholeSaleProductList.first.productname);
        isLoading.value = false;
      }
    } on Exception catch (e) {
      print(e);
        isLoading.value = false;

    }
  }

  
}
