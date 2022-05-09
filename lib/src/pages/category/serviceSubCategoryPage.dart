import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/controllers/category/serviceCategoryController.dart';
import '../../Widgets/button/customBackButton.dart';
import '../../Widgets/cardWidget/customCardWidget.dart';
import '../../configs/appUtils.dart';
import '../../widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';
import '../../widgets/textWidget/kText.dart';

class ServiceSubCategoryPage extends StatelessWidget with BaseController {
  final categorySlug;
  ServiceSubCategoryPage({
    required this.categorySlug,
  });

  Future<void> _refresh() {
    _resetList();
    return _getList();
  }

  void _resetList() {
    ServiceCategoryController().serviceSubCategoryList.clear();
    ServiceCategoryController().serviceCategoryList.clear();
  }

  Future _getList() {
    ServiceCategoryController().getAllServiceCategory();
    ServiceCategoryController().getAllServiceSubCategory(categorySlug);

    return BaseController().appLogoC.getAppLogo();
  }

  final keyRefresh = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    serviceCategoryC.getAllServiceSubCategory(categorySlug);
    ServiceCategoryController().serviceSubCategoryList.clear();

    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'Service Sub Category',
          fontSize: 18,
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          key: keyRefresh,
          child: serviceCategoryC.serviceSubCategoryList.length == 0
              ? EmptyAnimation()
              : Padding(
                  padding: paddingH10V10,
                  child: GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: serviceCategoryC.serviceSubCategoryList.length,
                    itemBuilder: (context, index) {
                      final item =
                          serviceCategoryC.serviceSubCategoryList[index];

                      return serviceCategoryC.isLoading.value == true
                          ? LoadingAnimation()
                          : GestureDetector(
                              onTap: () =>
                                  serviceCategoryDataC.getServiceCategoryData(
                                item.ssubcatename,
                                item.slug,
                              ),
                              child: CustomCardWidget(
                                child: Container(
                                  width: 140,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CachedNetworkImageWidget(
                                        imageUrl: item.image.toString(),
                                        width: 110,
                                        height: 90,
                                        fit: BoxFit.cover,
                                      ),
                                      sizeH10,
                                      Text(
                                        item.ssubcatename.toString(),
                                        softWrap: true,
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
