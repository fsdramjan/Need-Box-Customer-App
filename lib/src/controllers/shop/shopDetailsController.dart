import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:needbox_customer/src/controllers/shop/shopProductController.dart';
import 'package:needbox_customer/src/models/shop/shopDetailsModel.dart';
import '../../configs/appConfigs.dart';

class ShopDetailsController extends GetxController {
  final dio = Dio();

  var shop = ShopDetailsModel().obs;

  Future<ShopDetailsModel>? getShopDetails(shopId) async {
    var _shoplist = await DetailsApiService().fetchApi(shopId);
    ShopProductController().getAllShopProduct(shopId: shopId);
    return shop.value = _shoplist;
  }
}

class DetailsApiService {
  Future<ShopDetailsModel> fetchApi(shopId) async {
    var url = baseUrl + 'vandorshop/$shopId';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var dataResponse = jsonDecode(response.body);

      var shop = ShopDetailsModel.fromJson(dataResponse['vandorshop']);

      return shop;
    } else {
      throw Exception('Failed Get API');
    }
  }
}
