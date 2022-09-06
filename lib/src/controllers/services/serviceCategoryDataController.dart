import 'package:get/get.dart';
import '../../configs/appConfigs.dart';
import '../../models/category/serviceCategoryDataModel.dart';

class ServiceCategoryDataController extends GetxController {
  final serviceCategoryData = RxList<ServiceCategoryDataModel>();
  final isLoading = RxBool(false);
  getServiceCategoryData(title, slug) async {
    try {
      isLoading.value = true;
      final res = await dio.get(baseUrl + 'service/post/$slug');

      final List<ServiceCategoryDataModel> data = res.data['services']
          .map((json) => ServiceCategoryDataModel.fromJson(json))
          .toList()
          .cast<ServiceCategoryDataModel>();

      print(title);
      print(slug);
      if (res.statusCode == 200) {
        serviceCategoryData.clear();
        serviceCategoryData.addAll(data);
        isLoading.value = false;

        // Get.to(ServiceCategoryDataPage(title: title, slug: slug));
      }
    } on Exception catch (e) {
      print(e);
      isLoading.value = false;
    }
  }
}
