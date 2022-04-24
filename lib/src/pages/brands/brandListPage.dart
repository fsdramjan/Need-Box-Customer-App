import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/widgets/button/customBackButton.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

import '../../Widgets/cardWidget/customCardWidget.dart';
import '../../animations/loadingAnimation.dart';
import '../../configs/appUtils.dart';

import '../../widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';

class BrandListPage extends StatelessWidget with BaseController {
  Future<void> _refresh() {
    _resetList();
    return _getList();
  }

  void _resetList() {
    brandListC.brandsList.clear();
  }

  Future _getList() {
    brandListC.getAllBrandList();
    return appLogoC.getAppLogo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'All Brands',
          fontSize: 16,
        ),
      ),
      body: Obx(
        () => brandListC.isLoading.value == true
            ? LoadingAnimation()
            : brandListC.brandsList.isEmpty
                ? EmptyAnimation()
                : RefreshIndicator(
                    onRefresh: _refresh,
                    child: Padding(
                      padding: paddingH10,
                      child: GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                        ),
                        itemCount: brandListC.brandsList.length,
                        itemBuilder: (context, index) {
                          final item = brandListC.brandsList[index];

                          return GestureDetector(
                            onTap: () =>
                                brandProductListC.getAllBrandProductList(
                              id: item.id,
                              brandName: item.brandName,
                            ),
                            child: CustomCardWidget(
                              child: Container(
                                width: 140,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CachedNetworkImageWidget(
                                      imageUrl: item.image.toString(),
                                      width: 110,
                                      height: 90,
                                      fit: BoxFit.cover,
                                    ),
                                    sizeH10,
                                    Text(
                                      item.brandName.toString(),
                                      softWrap: true,
                                      // "TV & Home Appliances$index",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
      ),
    );
  }
}
