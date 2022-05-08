import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';

class OrderTrackController extends GetxController {
  final orderTrack = RxMap();


  getTrackingOrder(trackId) async {
    try {
      final res = await dio.post(
        baseUrl + 'order/track?trackId=$trackId',
      );
      print(res.statusCode);
      print(res.headers);
      // print(res.body);
      // print(res.unauthorized);
      print(res.realUri);
      print(res.statusMessage);
      print(res.data);
      print(res.realUri);
      print(res.requestOptions);

      orderTrack.value = res.data['trackorder'];
    } catch (e) {
      print(e);
    }
  }
//   var orderTrack = OrderTrackModel().obs;

//   Future<OrderTrackModel>? getOrderTrackDetails(trackId) async {
//     var _trackOrderlist = await OrderTrackApiService().fetchApi(trackId);
//     print(orderTrack);

//     return orderTrack.value = _trackOrderlist;
//   }
// }

// final body = {
//   'trackId':'3896004',
// };

// class OrderTrackApiService {
//   Future<OrderTrackModel> fetchApi(trackId) async {
//     var url = baseUrl + 'order/track?trackId=$trackId';

//     var response = await http.post(Uri.parse(url),body:body );

//     if (response.statusCode == 200) {
//       var dataResponse = jsonDecode(response.body);

//       var singleOrder = OrderTrackModel.fromJson(dataResponse);

//       return singleOrder;
//     } else {
//       throw Exception('Failed Get API');
//     }
//   }
}
