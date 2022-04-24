import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/products/specialOfferProductModel.dart';

class SpecialOfferProductsController extends GetxController {
  final specialOfferProductList = RxList<SpecialOfferProductModel>();
  final isLoading = RxBool(false);

  getAllSpecialOfferProduct() async {
    try {
      isLoading.value = true;
      final res = await dio.get(baseUrl + 'special-offer');

      final List<SpecialOfferProductModel> data = res.data['products']['data']
          .map((json) => SpecialOfferProductModel.fromJson(json))
          .toList()
          .cast<SpecialOfferProductModel>();
      if (res.statusCode == 200) {
        specialOfferProductList.clear();
        specialOfferProductList.addAll(data);
        isLoading.value = false;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
