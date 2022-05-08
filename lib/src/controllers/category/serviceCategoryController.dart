import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/category/serviceCategoryModel.dart';

import '../../components/category/serviceSubCategoryModel.dart';

class ServiceCategoryController extends GetxController {
  final serviceCategoryList = RxList<ServiceCategoryModel>();
  final serviceSubCategoryList = RxList<ServiceSubCategoryModel>();
  //
  final isLoading = RxBool(false);
  getAllServiceCategory() async {
    try {
      isLoading.value = true;
      final res = await dio.get(baseUrl + 'service/category');

      final List<ServiceCategoryModel> data = res.data['service']
          .map((json) => ServiceCategoryModel.fromJson(json))
          .toList()
          .cast<ServiceCategoryModel>();
      if (res.statusCode == 200) {
        serviceCategoryList.clear();
        serviceCategoryList.addAll(data);
        isLoading.value = false;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
  getAllServiceSubCategory(categorySlug) async {
    try {
      isLoading.value = true;
      final res = await dio.get(baseUrl + 'service/subcategory/$categorySlug');

      final List<ServiceSubCategoryModel> data = res.data['servicesubcategories']
          .map((json) => ServiceSubCategoryModel.fromJson(json))
          .toList()
          .cast<ServiceSubCategoryModel>();
      if (res.statusCode == 200) {
        serviceSubCategoryList.clear();
        serviceSubCategoryList.addAll(data);
        isLoading.value = false;
      }
    } on Exception catch (e) {
      print(e);
    }
  }




}
