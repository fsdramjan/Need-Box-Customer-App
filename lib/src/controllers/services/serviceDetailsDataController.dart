import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:needbox_customer/src/models/category/ServiceDetailsDataModel.dart';
import '../../configs/appConfigs.dart';

class ServiceDetailsDataController extends GetxController {
  var serviceDetails = ServiceDetailsDataModel().obs;
  var sellersInfo = SellerInfo().obs;

  Future<ServiceDetailsDataModel>? getServiceDetails(slug, id) async {
    var _productlist = await DetailsApiService().fetchApi(slug, id);
    print(slug);
    print(id);

    return serviceDetails.value = _productlist;
  }
    Future<SellerInfo>? sellerInfo(slug, id) async {
    var _sellerlist = await SellerApiService().fetchApi(slug, id);
    print(slug);
    print(id);

    return sellersInfo.value = _sellerlist;
  }
}

class DetailsApiService {
  Future<ServiceDetailsDataModel> fetchApi(slug, id) async {
    var url = baseUrl + 'service/details/$id/$slug';

    print(baseUrl + 'service/details/$id/$slug');

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var dataResponse = jsonDecode(response.body);

      var singleProduct =
          ServiceDetailsDataModel.fromJson(dataResponse['servicedetails']);

      return singleProduct;
    } else {
      throw Exception('Failed Get API');
    }
  }


}

class SellerApiService {
  Future<SellerInfo> fetchApi(slug, id) async {
    var url = baseUrl + 'service/details/$id/$slug';

    print(baseUrl + 'service/details/$id/$slug');

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var dataResponse = jsonDecode(response.body);

      var singleProduct =
          SellerInfo.fromJson(dataResponse['sellerInfo']);

      return singleProduct;
    } else {
      throw Exception('Failed Get API');
    }
  }
}
