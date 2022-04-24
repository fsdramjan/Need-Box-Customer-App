import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/widgets/button/customBackButton.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

import '../../Widgets/cardWidget/customCardWidget.dart';
import '../../animations/loadingAnimation.dart';
import '../../configs/appUtils.dart';

import '../../widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';

class AllCategoryPage extends StatelessWidget with BaseController {
  Future<void> _refresh() {
    _resetList();
    return _getList();
  }

  void _resetList() {
    allCategoryC.allCategoryList.clear();
  }

  Future _getList() {
    allCategoryC.getAllCategory();
    return appLogoC.getAppLogo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'All Category',
          fontSize: 16,
        ),
      ),
      body: Obx(
        () => allCategoryC.allCategoryList.isEmpty
            ? LoadingAnimation()
            : RefreshIndicator(
                onRefresh: _refresh,
                child: GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: allCategoryC.allCategoryList.length,
                  itemBuilder: (context, index) {
                    final item = allCategoryC.allCategoryList[index];

                    return GestureDetector(
                      onTap: (() => categoryProductC.getAllCategoryProduct(
                            id: item.id,
                            categoryName: item.catname,
                          )),
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
                                item.catname.toString(),
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
    );
  }
}
