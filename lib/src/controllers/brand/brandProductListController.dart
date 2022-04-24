import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/products/allProductModel.dart';
import 'package:needbox_customer/src/pages/brands/brandProductListPage.dart';

class BrandsProductListController extends GetxController {
  final brandProductList = RxList<AllProductModel>();
  final isLoading = RxBool(false);

  getAllBrandProductList({required int? id,required String? brandName}) async {
    try {
      isLoading.value = true;
      final res = await dio.get(baseUrl + 'brand-products/$id');

      final List<AllProductModel> data = res.data['products']
          .map((json) => AllProductModel.fromJson(json))
          .toList()
          .cast<AllProductModel>();
      if (res.statusCode == 200) {
        brandProductList.clear();
        Get.to(BrandProductListPage(id: id, brandName:brandName.toString() ,));
        print(res.data);
        brandProductList.clear();

        brandProductList.addAll(data);
        isLoading.value = false;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
