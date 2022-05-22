import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/customerPost/customerPostmodel.dart';

class CustomerPostListController extends GetxController {
  final customerPostList = RxList<CustomerPostModel>();
  final isLoading = RxBool(false);
  getAllCustomerPost() async {
    try {
      isLoading.value = true;
      final res = await dio.get(baseUrl + 'customer/post');

      final List<CustomerPostModel> data = res.data['customerpost']
          .map((json) => CustomerPostModel.fromJson(json))
          .toList()
          .cast<CustomerPostModel>();
      if (res.statusCode == 200) {
        customerPostList.clear();
        customerPostList.addAll(data);
        isLoading.value = false;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
