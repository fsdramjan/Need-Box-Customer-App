import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/shop/shopListModel.dart';

class ShopListController extends GetxController {
  final shopList = RxList<ShopListModel>();
  final isLoading = RxBool(false);

  getAllShopList() async {
    try {
      isLoading.value = true;
      final res = await dio.get(baseUrl + 'shops');

      final List<ShopListModel> data = res.data['shops']
          .map((json) => ShopListModel.fromJson(json))
          .toList()
          .cast<ShopListModel>();

      if (res.statusCode == 200) {
        shopList.clear();

        shopList.addAll(data);
        isLoading.value = false;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
