import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/slider/sliderModel.dart';

class SliderController extends GetxController {
  final sliderList = RxList<SliderModel>();
  getSliderList() async {
    try {
      final res = await dio.get(baseUrl + 'slider');

      final List<SliderModel> data = res.data['sliders']
          .map((json) => SliderModel.fromJson(json))
          .toList()
          .cast<SliderModel>();
      // print('------------------>');

      // print(sliderList.length.toString());
      // print('------------------>${res.data['sliders']}');
      sliderList.clear();
      return sliderList.addAll(data);
    } catch (e) {
      print(e);
    }
  }
}
