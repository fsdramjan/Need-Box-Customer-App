import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/area/areaModel.dart';

class AreaListController extends GetxController {
  final allArea = RxList<AreaModel>();
  final isLoading = RxBool(false);
  getAllArea({required districtsId}) async {
    try {
      isLoading.value = true;
      final res = await dio.get(baseUrl + 'area/$districtsId');

      final List<AreaModel> data = res.data['areas']
          .map((json) => AreaModel.fromJson(json))
          .toList()
          .cast<AreaModel>();
      if (res.statusCode == 200) {
        allArea.clear();
        allArea.addAll(data);
        isLoading.value = false;
      }
    } on Exception catch (e) {
        isLoading.value = false;
      print(e);
    }
  }
}
