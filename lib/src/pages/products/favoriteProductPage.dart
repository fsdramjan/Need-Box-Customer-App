import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/models/hive/favoriteProductModel.dart';
import 'package:needbox_customer/src/pages/products/productDetailsPage.dart';
import 'package:needbox_customer/src/widgets/cardWidget/customGridProducts.dart';

import '../../configs/appColors.dart';

class ProductFavoritePage extends StatelessWidget with BaseController {
  final favoriteBox = Hive.box<FavoriteProductModel>('favBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        builder: (BuildContext context, value, Widget? child) {
          return favoriteBox.isEmpty
              ? EmptyAnimation(
                  title: 'There is no favorite product',
                )
              : Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 2,
                            childAspectRatio: 0.65,
                          ),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: favoriteBox.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = favoriteBox.getAt(index);

                            return CustomGridCardWidget(
                              onTap: () => Get.to(
                                ProductDetailsPage(
                                  id: item!.id,
                                  proName: item.productname,
                                  image: item.image,
                                ),
                              ),
                              isFavoritePage: true,
                              imageUrl: item!.image,
                              favoriteIcon: GestureDetector(
                                onTap: () => favoriteBox.delete(item.id),
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: white,
                                  child: Icon(
                                    favoriteBox.containsKey(item.id)
                                        ? Ionicons.trash
                                        : Ionicons.trash_outline,
                                    color: orangeO50,
                                    size: 15,
                                  ),
                                ),
                              ),
                              productname: item.productname.toString(),
                              discount: item.discount,
                              disprice: item.proDisPrice,
                              oldprice: item.proPrice,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
        },
        valueListenable: favoriteBox.listenable(),
      ),
    );
  }
}
