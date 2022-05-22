import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';

import '../../models/products/allProductModel.dart';

class SearchProductController extends GetxController {
  final searchProductList = RxList<AllProductModel>();

  final searchText = RxString('');

  getSearchProduct({required categoryId}) async {
    try {
      final res = await dio.post(
          baseUrl + 'search/product?category=$categoryId&keyword=$searchText ',
          data: {
            'category': categoryId,
            'keyword': searchText.value,
          });

      print('${searchText.value} $categoryId');
      final List<AllProductModel> data = res.data['products']['data']
          .map((json) => AllProductModel.fromJson(json))
          .toList()
          .cast<AllProductModel>();
      print('+++++++++++++++++++++++++++++++++++++++++++>');
      print(res.statusCode);
      print(res.headers);
      // print(res.body);
      // print(res.unauthorized);
      print(res.realUri);
      print(res.statusMessage);
      print(res.data);
      print(res.realUri);
      print(res.requestOptions);
      print('+++++++++++++++++++++++++++++++++++++++++++>');

      if (res.statusCode == 200) {
        searchProductList.clear();
        searchProductList.addAll(data);
        print(searchProductList.first.productname);

        return res.data;
      }
    } catch (e) {
      print(e);
    }
  }
}
