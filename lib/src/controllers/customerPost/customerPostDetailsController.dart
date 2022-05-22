import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
 
import 'package:needbox_customer/src/models/customerPost/customerPostmodel.dart';
import '../../configs/appConfigs.dart';

class CustomerPostDetailsController extends GetxController {
  var customerPost = CustomerPostModel().obs;

  Future<CustomerPostModel>? getPostDetails(slug, id) async {
    var _customerPostlist = await DetailsApiService().fetchApi(slug, id);
    print(slug);
    print(id);

    return customerPost.value = _customerPostlist;
  }
}

class DetailsApiService {
  Future<CustomerPostModel> fetchApi(slug, id) async {
    var url = baseUrl + 'customer/post/details/$id/$slug';

    print(url);

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var dataResponse = jsonDecode(response.body);

      var singlePost =
          CustomerPostModel.fromJson(dataResponse['customerdepost']);

      return singlePost;
    } else {
      throw Exception('Failed Get API');
    }
  }
}
