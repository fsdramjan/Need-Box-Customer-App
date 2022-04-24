import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/brand/brandModel.dart';

class BrandsListController extends GetxController {
  final brandsList = RxList<BrandModel>();
  final isLoading = RxBool(false);

  getAllBrandList() async {
    try {
      isLoading.value = true;
      final res = await dio.get(baseUrl + 'brands');

      final List<BrandModel> data = res.data['brands']
          .map((json) => BrandModel.fromJson(json))
          .toList()
          .cast<BrandModel>();
      print(data.length);
      if (res.statusCode == 200) {
        brandsList.clear();
        brandsList.addAll(data);
        isLoading.value = false;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
