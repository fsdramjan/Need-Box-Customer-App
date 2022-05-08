import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
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
  @override
  Widget build(BuildContext context) {
    serviceCategoryC.getAllServiceSubCategory(categorySlug);
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: 'Service Sub Category',
          fontSize: 18,
        ),
      ),
      body: SafeArea(
        child: GridView.builder(
          shrinkWrap: true,
          primary: false,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
          ),
          itemCount: serviceCategoryC.serviceSubCategoryList.length,
          itemBuilder: (context, index) {
            final item = serviceCategoryC.serviceSubCategoryList[index];

            return GestureDetector(
              onTap: () {},
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
    );
  }
}
