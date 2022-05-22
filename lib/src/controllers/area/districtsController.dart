import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/area/districtsModel.dart';

class DistrictsListController extends GetxController {
  final allDistricts = RxList<DistrictsModel>();
  final isLoading = RxBool(false);
  getAllDistricts() async {
    try {
      isLoading.value = true;
      final res = await dio.get(baseUrl + 'districts');

      final List<DistrictsModel> data = res.data['districts']
          .map((json) => DistrictsModel.fromJson(json))
          .toList()
          .cast<DistrictsModel>();
      if (res.statusCode == 200) {
        allDistricts.clear();
        allDistricts.addAll(data);
        isLoading.value = false;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
