import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../configs/appConfigs.dart';
import '../../models/products/ProductDetailsModel.dart';

class ProductDetailsController extends GetxController {
  final dio = Dio();

  var product = ProductDetailsModel().obs;
 
 
  Future<ProductDetailsModel>? getProductDetails(productId) async {
    var _productlist = await DetailsApiService().fetchApi(productId);
    print(product);

    return product.value = _productlist;
  }
}

class DetailsApiService {
  Future<ProductDetailsModel> fetchApi(productId) async {
    var url = baseUrl + 'product-details/$productId';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var dataResponse = jsonDecode(response.body);

      var singleProduct = ProductDetailsModel.fromJson(dataResponse);

      return singleProduct;
    } else {
      throw Exception('Failed Get API');
    }
  }
}
