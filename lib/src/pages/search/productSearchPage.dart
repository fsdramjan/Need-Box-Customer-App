// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/widgets/button/customBackButton.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';

import '../../configs/appColors.dart';
import '../../widgets/cardWidget/customGridProducts.dart';
import '../../widgets/formField/searchFormField.dart';
import '../products/productDetailsPage.dart';
import '../products/wholesaleProductPage.dart';

class ProductSearchPage extends StatefulWidget with BaseController {
  @override
  State<ProductSearchPage> createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage>
    with BaseController {
  final searchTextC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // searchTextC.clear();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          80,
        ),
        child: Container(
          color: white,
          child: Padding(
            padding: EdgeInsets.only(top: 40),
            child: Row(
              children: [
                customBackButton(),
                Expanded(
                  child: searchFormField(
                    isFormEnable: true,
                    controller: searchTextC,
                    onTap: () {
                      setState(() {
                        searchProductListC.searchText.value = searchTextC.text;

                        searchProductListC.getSearchProduct(categoryId: '8');
                      });
                    },
                    onChanged: searchProductListC.searchText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: paddingH10,
        child: Obx(
          () => searchProductListC.searchProductList.isEmpty
              ? Center(
                  child: KText(
                    text: 'No Data Found!',
                    color: black54,
                  ),
                )
              : searchTextC.text.isEmpty
                  ? Center(
                      child: KText(
                        text: 'Search anything!',
                        color: black54,
                      ),
                    )
                  : ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        sizeH10,
                        GridView.builder(
                          shrinkWrap: true,
                          primary: false,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.70,
                          ),
                          itemCount:
                              searchProductListC.searchProductList.length,
                          itemBuilder: (context, index) {
                            final item =
                                searchProductListC.searchProductList[index];

                            return CustomGridCardWidget(
                              discount: item.productdiscount,
                              disprice: item.productnewprice,
                              oldprice: item.productoldprice,
                              onTap: () => item.productnewprice == null
                                  ? Get.to(
                                      WholesaleProductPage(),
                                    )
                                  : Get.to(
                                      ProductDetailsPage(
                                        id: item.id,
                                        proName: item.productname,
                                        image: item.proImage!.image.toString(),
                                      ),
                                    ),
                              productname: item.productname.toString(),
                              imageUrl: item.proImage!.image.toString(),
                            );
                          },
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
