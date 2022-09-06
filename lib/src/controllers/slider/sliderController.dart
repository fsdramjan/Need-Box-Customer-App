import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/slider/sliderModel.dart';

class SliderController extends GetxController {
  final sliderList = RxList<SliderModel>();
  final wholesaleSliderList = RxList<SliderModel>();
  final customerPostSliderList = RxList<SliderModel>();
  final popUpSliderList = RxList<SliderModel>();
  var isLoading = RxBool(false);

  getSliderList() async {
    try {
      isLoading.value = true;

      final res = await dio.get(baseUrl + 'slider');

      final List<SliderModel> data = res.data['sliders']
          .map((json) => SliderModel.fromJson(json))
          .toList()
          .cast<SliderModel>();
      // print('------------------>');

      // print(sliderList.length.toString());
      // print('------------------>${res.data['sliders']}');
      sliderList.clear();
      isLoading.value = false;

      return sliderList.addAll(data);
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }

  wholesaleBanner() async {
    try {
      isLoading.value = true;

      final res = await dio.get(baseUrl + 'wholesale/banner');
      final List<SliderModel> data = res.data['wsalebanners']
          .map((json) => SliderModel.fromJson(json))
          .toList()
          .cast<SliderModel>();

      if (res.statusCode == 200) {
        wholesaleSliderList.clear();
        wholesaleSliderList.addAll(data);
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }

  customerPostBanner() async {
    try {
      isLoading.value = true;

      final res = await dio.get(baseUrl + 'customer-post/banner');
      final List<SliderModel> data = res.data['cpostbanners']
          .map((json) => SliderModel.fromJson(json))
          .toList()
          .cast<SliderModel>();

      if (res.statusCode == 200) {
        customerPostSliderList.clear();
        customerPostSliderList.addAll(data);
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }

  popUpBanner() async {
    try {
      isLoading.value = true;

      final res = await dio.get(baseUrl + 'popup/banner');
      final List<SliderModel> data = res.data['popupbanners']
          .map((json) => SliderModel.fromJson(json))
          .toList()
          .cast<SliderModel>();

      if (res.statusCode == 200) {
        popUpSliderList.clear();
        popUpSliderList.addAll(data);
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }
}
