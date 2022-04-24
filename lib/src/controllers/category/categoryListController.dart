import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/category/categoryListModel.dart';

class CategoryListController extends GetxController {
  final allCategoryList = RxList<CategoryListModel>();
  final isLoading = RxBool(false);
  getAllCategory() async {
    try {
      isLoading.value = true;
      final res = await dio.get(baseUrl + 'category');

      final List<CategoryListModel> data = res.data['categories']
          .map((json) => CategoryListModel.fromJson(json))
          .toList()
          .cast<CategoryListModel>();
      if (res.statusCode == 200) {
        allCategoryList.clear();
        allCategoryList.addAll(data);
        isLoading.value = false;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
