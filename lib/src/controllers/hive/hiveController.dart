import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:needbox_customer/src/models/hive/favoriteProductModel.dart';
import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:path_provider/path_provider.dart';

class HiveController extends GetxController {
 
  Future<void> initDatabase() async {
    Directory? appDocDir = await getApplicationDocumentsDirectory();

    Hive.init(appDocDir.path);
    await registerBoxesAndAdapters();
  }

  Future<void> registerBoxesAndAdapters() async {
    Hive.registerAdapter(FavoriteProductModelAdapter());
    await Hive.openBox<FavoriteProductModel>('favBox');
    print('Favorite C Work');
  }

 
}
