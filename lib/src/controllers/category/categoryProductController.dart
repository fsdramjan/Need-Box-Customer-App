import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/category/categoryProductModel.dart';


class CategoryProductsController extends GetxController {
  final categoryProductList = RxList<CategoryProductModel>();

  final isLoading = RxBool(false);
  getAllCategoryProduct({
    required int? id,
    required String? categoryName,
  }) async {
    try {
      isLoading.value = true;
      final res = await dio.get(baseUrl + 'category-products/$id');
      final List<CategoryProductModel> data = res.data['products']['data']
          .map((json) => CategoryProductModel.fromJson(json))
          .toList()
          .cast<CategoryProductModel>();
      if (res.statusCode == 200) {
        categoryProductList.clear();
        categoryProductList.addAll(data);
        isLoading.value = false;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
