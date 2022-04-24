import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appConfigs.dart';
import 'package:needbox_customer/src/models/Campaign/campaignModel.dart';

class CampaignListController extends GetxController {
  final campaignList = RxList<CampaignsModel>();
  final isLoading = RxBool(false);

  getAllCampaignList() async {
    try {
      isLoading.value = true;
      final res = await dio.get(baseUrl + 'campaigns');

      final List<CampaignsModel> data = res.data['campaigns']
          .map((json) => CampaignsModel.fromJson(json))
          .toList()
          .cast<CampaignsModel>();
      print(data.length);
      if (res.statusCode == 200) {
        campaignList.clear();
        campaignList.addAll(data);
        isLoading.value = false;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
