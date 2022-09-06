import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needbox_customer/src/animations/emptyAnimation.dart';
import 'package:needbox_customer/src/animations/loadingAnimation.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/controllers/services/serviceCategoryController.dart';
import 'package:needbox_customer/src/pages/category/serviceCategoryDataPage.dart';
import '../../Widgets/button/customBackButton.dart';
import '../../Widgets/cardWidget/customCardWidget.dart';
import '../../configs/appUtils.dart';
import '../../widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';
import '../../widgets/textWidget/kText.dart';

class ServiceSubCategoryPage extends StatefulWidget with BaseController {
  final categorySlug;
  ServiceSubCategoryPage({
    required this.categorySlug,
  });

  @override
  State<ServiceSubCategoryPage> createState() => _ServiceSubCategoryPageState();
}

class _ServiceSubCategoryPageState extends State<ServiceSubCategoryPage>
    with BaseController {
  @override
  void initState() {
    ServiceCategoryController().serviceSubCategoryList.clear();
    serviceCategoryC.getAllServiceSubCategory(widget.categorySlug);
    super.initState();
  }

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
    ServiceCategoryController().getAllServiceSubCategory(widget.categorySlug);

    return BaseController().appLogoC.getAppLogo();
  }

  final keyRefresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
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
          child: Padding(
            padding: paddingH10V10,
            child: Obx(
              () => serviceCategoryC.isSubLoading.value == true
                  ? LoadingAnimation()
                  : serviceCategoryC.serviceSubCategoryList.length == 0
                      ? EmptyAnimation()
                      : GridView.builder(
                          shrinkWrap: true,
                          primary: false,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.2,
                          ),
                          itemCount:
                              serviceCategoryC.serviceSubCategoryList.length,
                          itemBuilder: (context, index) {
                            final item =
                                serviceCategoryC.serviceSubCategoryList[index];

                            return GestureDetector(
                              onTap: () => Get.to(
                                ServiceCategoryDataPage(
                                  slug: item.slug.toString(),
                                  title: item.ssubcatename.toString(),
                                ),
                              ),
                              //     serviceCategoryDataC.getServiceCategoryData(
                              //   item.ssubcatename,
                              //   item.slug,
                              // ),
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
      ),
    );
  }
}
