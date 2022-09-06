// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/models/area/shippingAddressModel.dart';
import 'package:needbox_customer/src/widgets/button/customPrimaryButton.dart';
import 'package:needbox_customer/src/widgets/formField/customFormField.dart';

import '../../configs/appColors.dart';
import '../../widgets/appBar/customTitleAppBar.dart';
import '../../widgets/bottomSheet/customBottomSheet.dart';
import '../../widgets/snackBar/customSnackbarWidget.dart';
import '../../widgets/textWidget/kText.dart';

class ShippingAddressPage extends StatefulWidget { 
  late Rx<ShippingAddressModel> data;

  @override
  State<ShippingAddressPage> createState() => _ShippingAddressPageState();
}

class _ShippingAddressPageState extends State<ShippingAddressPage>
    with BaseController {
  //

  @override
  void initState() {
    shippingAddressC.shipAddressData.refresh();

    shippingAddressC.getShipAddress();
    widget.data = shippingAddressC.shipAddressData;

    name.text = (widget.data.value.name == null ? '' : widget.data.value.name)!;
    phone.text =
        (widget.data.value.phone == null ? '' : widget.data.value.phone)!;
    stateAddress.text = (widget.data.value.stateaddress == null
        ? ''
        : widget.data.value.stateaddress)!;
    houseAddress.text = (widget.data.value.houseaddress == null
        ? ''
        : widget.data.value.houseaddress)!;
    fullAddress.text = (widget.data.value.fulladdress == null
        ? ''
        : widget.data.value.fulladdress)!;
    zipCode.text =
        (widget.data.value.zipcode == null ? '' : widget.data.value.zipcode)!;

    selectedDistricts = widget.data.value.district!.id == null
        ? null
        : widget.data.value.district!.id.toString();
    selectedDistrictsName = widget.data.value.district!.name == null
        ? null
        : widget.data.value.district!.name.toString();
    selectedArea = widget.data.value.area!.id == null
        ? null
        : widget.data.value.area!.id.toString();
    selectedAreaName = widget.data.value.area!.area == null
        ? null
        : widget.data.value.area!.area.toString();
    areaListC.getAllArea(districtsId: widget.data.value.district!.id);
    super.initState();
  }

  final name = TextEditingController();
  final phone = TextEditingController();
  final stateAddress = TextEditingController();
  final houseAddress = TextEditingController();
  final fullAddress = TextEditingController();
  final zipCode = TextEditingController();

  //

  String? selectedDistricts = '';
  String? selectedDistrictsName = '';
  String? selectedArea = '';
  String? selectedAreaName = '';

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAndTitleAppBar(
        title: 'Shipping Address',
      ),
      body: Padding(
        padding: paddingH10V10,
        child: Container(
          color: white,
          child: ListView(
            children: [
              customFormField(
                height: 45,
                hintText: 'Name',
                isStarEnable: true,
                titleText: 'Name',
                controller: name,
              ),
              sizeH10,
              customFormField(
                height: 45,
                hintText: 'Phone',
                isStarEnable: true,
                titleText: 'Phone',
                controller: phone,
              ),
              sizeH10,
              districts(),
              areas(),
              customFormField(
                height: 45,
                hintText: 'State Address',
                isStarEnable: true,
                titleText: 'State Address',
                controller: stateAddress,
              ),
              sizeH10,
              customFormField(
                height: 45,
                hintText: 'House Address',
                isStarEnable: true,
                titleText: 'House Address',
                controller: houseAddress,
              ),
              sizeH10,
              customFormField(
                height: 45,
                hintText: 'Full Address',
                isStarEnable: true,
                titleText: 'Full Address',
                controller: fullAddress,
              ),
              sizeH10,
              customFormField(
                height: 45,
                hintText: 'Zip Code',
                isStarEnable: true,
                titleText: 'Zip Code',
                controller: zipCode,
              ),
              sizeH30,
              customPrimaryButton(
                onTap: () => shippingAddressC.shipAddress(
                  name: name.text,
                  phone: phone.text,
                  address: fullAddress.text,
                  zipCode: zipCode.text,
                  stateAddress: stateAddress.text,
                  houseAddress: houseAddress.text,
                  districts: selectedDistricts,
                  area: selectedArea,
                ),
                color: orangeO50,
                height: 45,
                title: 'Submit',
                child: Container(),
              ),
              sizeH30,
            ],
          ),
        ),
      ),
    );
  }

  Widget districts() => ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          Row(
            children: [
              KText(
                text: 'Districts',
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
              KText(
                text: ' *',
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ],
          ),
          sizeH10,
          GestureDetector(
            onTap: () => customBottomSheetWidget(
              context: context,
              height: 500,
              child: FittedBox(
                child: Container(
                  height: 500 / 1.05,
                  width: Get.width,
                  child: Obx(
                    () => ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: districtsListC.allDistricts.length,
                        itemBuilder: (context, i) {
                          final items = districtsListC.allDistricts[i];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedArea = null;
                                selectedAreaName = null;
                                selectedDistrictsName = items.name;
                                selectedDistricts = items.id.toString();

                                areaListC.getAllArea(districtsId: items.id);
                                Get.back();
                              });
                              print(selectedDistrictsName);
                              print(selectedDistricts);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 3),
                              child: Container(
                                height: 40,
                                width: Get.width,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: selectedDistrictsName ==
                                          items.name.toString()
                                      ? orangeO50
                                      : white,
                                ),
                                child: Padding(
                                  padding: paddingH10,
                                  child: KText(
                                    text: items.name.toString(),
                                    fontSize: 16,
                                    color: selectedDistrictsName ==
                                            items.name.toString()
                                        ? white
                                        : black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ),
            child: Container(
              height: 45,
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border.all(
                  color: grey.shade300,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KText(
                    text:
                        selectedDistrictsName == null || selectedAreaName == ''
                            ? 'Select Districts'
                            : selectedDistrictsName.toString(),
                    fontSize: selectedDistrictsName != null ? 14 : 12,
                    color: selectedDistrictsName != null ? black : black54,
                  ),
                  Icon(
                    Icons.expand_more,
                    color: black54,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          sizeH30,
        ],
      );

  Widget areas() => ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          Row(
            children: [
              KText(
                text: 'Areas',
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
              KText(
                text: ' *',
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ],
          ),
          sizeH10,
          GestureDetector(
            onTap: () => selectedDistricts == ''
                ? snackBarWidget(
                    title: 'Opps!',
                    message: 'select districts',
                    isRed: true,
                  )
                : customBottomSheetWidget(
                    context: context,
                    height: 500,
                    child: FittedBox(
                      child: Container(
                        height: 500 / 1.05,
                        width: Get.width,
                        child: Obx(
                          () => areaListC.allArea.length == 0
                              ? Center(
                                  child: KText(
                                    text: 'No Areas',
                                    color: black54,
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: areaListC.allArea.length,
                                  itemBuilder: (context, i) {
                                    final items = areaListC.allArea[i];
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedAreaName = items.area;
                                          selectedArea = items.id.toString();

                                          Get.back();
                                        });
                                        print(selectedAreaName);
                                        print(selectedArea);
                                      },
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 3),
                                        child: Container(
                                          height: 40,
                                          width: Get.width,
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: selectedAreaName ==
                                                    items.area.toString()
                                                ? orangeO50
                                                : white,
                                          ),
                                          child: Padding(
                                            padding: paddingH10,
                                            child: KText(
                                              text: items.area.toString(),
                                              fontSize: 16,
                                              color: selectedAreaName ==
                                                      items.area.toString()
                                                  ? white
                                                  : black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                        ),
                      ),
                    ),
                  ),
            child: Container(
              height: 45,
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border.all(
                  color: grey.shade300,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KText(
                    text: selectedAreaName == null || selectedAreaName == ''
                        ? 'Select Area'
                        : selectedAreaName.toString(),
                    fontSize: selectedAreaName != null ? 14 : 12,
                    color: selectedAreaName != null ? black : black54,
                  ),
                  Icon(
                    Icons.expand_more,
                    color: black54,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          sizeH30,
        ],
      );
}
