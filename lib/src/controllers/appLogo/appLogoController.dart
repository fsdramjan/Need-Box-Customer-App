import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/appLogo/appLogoModel.dart';

class AppLogoController extends GetxController {
  final appLogo = RxList<AppLogoModel>();
  getAppLogo() async {
    try {
      final res = await dio.get(baseUrl);

      final List<AppLogoModel> logoData = res.data['mainlogo']
          .map((json) => AppLogoModel.fromJson(json))
          .toList()
          .cast<AppLogoModel>();

      print(imageBaseUrl + '${res.data['mainlogo'][0]['logo']}');

      appLogo.clear();

        appLogo.addAll(logoData);
    } catch (e) {
      print(e);
    }
  }
}
