import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:needbox_customer/src/models/hive/favoriteProductModel.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../widgets/snackBar/customSnackbarWidget.dart';

class FavoriteProductController extends GetxController {
  final favBox = Hive.box<FavoriteProductModel>('favBox');

  manageFavorite({
    required int? id,
    required String? productName,
    required String? productColor,
    required String? image,
    required int? proPrice,
    required int? proDisPrice,
    required int? discount,
  }) async {
    if (favBox.containsKey(id)) {
      favBox.delete(id);
    } else {
      final data = FavoriteProductModel(
        id: id,
        productname: productName,
        image: image,
        productColor: productColor,
        proDisPrice: proDisPrice,
        proPrice: proPrice,
        discount: discount,
      );
      snackBarWidget(
        title: 'Success!',
        message: 'Product added to favoritelist',
        isRed: false,
      );

      await favBox.put(id, data);
    }
  }

  removeFav(int index) {
    favBox.getAt(index)!.delete();
  }
}
