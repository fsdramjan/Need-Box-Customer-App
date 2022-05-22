import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:needbox_customer/src/configs/appColors.dart';
import 'package:needbox_customer/src/configs/appUtils.dart';
import 'package:needbox_customer/src/controllers/MainController/baseController.dart';
import 'package:needbox_customer/src/models/customerPost/customerPostmodel.dart';
import 'package:needbox_customer/src/pages/imageView/imageViewPage.dart';
import 'package:needbox_customer/src/widgets/appBar/customTitleAppBar.dart';
import 'package:needbox_customer/src/widgets/button/customPrimaryButton.dart';
import 'package:needbox_customer/src/widgets/cardWidget/customCardWidget.dart';
import 'package:needbox_customer/src/widgets/snackBar/customSnackbarWidget.dart';
import 'package:needbox_customer/src/widgets/textWidget/kText.dart';
import '../../animations/loadingAnimation.dart';
import '../../configs/appConfigs.dart';
import '../../models/userAccount/userProfileDetailsModel.dart';
import '../../widgets/cachedNetworkImage/cachedNetworkImageWidget.dart';
import '../../widgets/formField/customFormField.dart';

class CustomerPostDetailsPage extends StatefulWidget with BaseController {
  final title;
  final slug;
  final id;
  final UserProfileDetailsModel? profileInfo;
  final userToken;

  CustomerPostDetailsPage({
    required this.title,
    required this.slug,
    required this.id,
    this.profileInfo,
    required this.userToken,
  });

  @override
  State<CustomerPostDetailsPage> createState() =>
      _CustomerPostDetailsPageState();
}

class _CustomerPostDetailsPageState extends State<CustomerPostDetailsPage>
    with BaseController {
  @override
  void initState() {
    serviceDetailsDataC.getServiceDetails(widget.slug, widget.id);
    nameTextC.text = widget.userToken == null
        ? ''
        : widget.profileInfo!.fullName == null
            ? ''
            : widget.profileInfo!.fullName.toString();
    phoneTextC.text = widget.userToken == null
        ? ''
        : widget.profileInfo!.phoneNumber == null
            ? ''
            : widget.profileInfo!.phoneNumber.toString();
    emailTextC.text = widget.userToken == null
        ? ''
        : widget.profileInfo!.email == null
            ? ''
            : widget.profileInfo!.email.toString();
    addressTextC.text = widget.userToken == null
        ? ''
        : widget.profileInfo!.address == null
            ? ''
            : widget.profileInfo!.address.toString();
    super.initState();
  }

  final nameTextC = TextEditingController();

  final phoneTextC = TextEditingController();

  final emailTextC = TextEditingController();

  final addressTextC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    customerPostDetailsC.getPostDetails(widget.slug, widget.id);
    return Scaffold(
      appBar: backAndTitleAppBar(
        title: '${widget.title}',
      ),
      body: FutureBuilder<CustomerPostModel>(
        future: customerPostDetailsC.getPostDetails(widget.slug, widget.id),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return LoadingAnimation();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final item = snapshot.data!;

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(
                      ImageViewPage(
                        image: item.image.toString(),
                        title: widget.title,
                      ),
                    ),
                    child: Container(
                      height: 200,
                      width: Get.width,
                      child: CachedNetworkImageWidget(
                        imageUrl: item.image.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  sizeH20,
                  Padding(
                    padding: paddingH10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          text: item.title.toString(),
                          fontSize: 18,
                        ),
                        sizeH10,
                        KText(
                          text: item.description.toString(),
                          fontSize: 14,
                          color: black54,
                        ),
                        sizeH10,
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: cartC.decrementQnty,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: grey.shade300,
                                    borderRadius: borderRadiusC5,
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    size: 25,
                                  ),
                                ),
                              ),
                              sizeW10,
                              KText(
                                text: cartC.quantityItems.toString(),
                                fontWeight: FontWeight.w600,
                              ),
                              sizeW10,
                              GestureDetector(
                                onTap: cartC.incrementQnty,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: grey.shade300,
                                    borderRadius: borderRadiusC5,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        sizeH20,
                        customPrimaryButton(
                          onTap: () => _defaultDialog(),
                          color: orangeO50,
                          height: 45,
                          title: 'Apply Now',
                          child: Container(),
                        ),
                        sizeH20,
                        Divider(color: orangeO50),
                        sizeH20,
                        CustomCardWidget(
                          width: Get.width,
                          child: Padding(
                            padding: paddingH10V10,
                            child: Column(
                              children: [
                                KText(
                                  text: 'Customer Info',
                                  fontSize: 18,
                                ),
                                Divider(color: grey.shade300),
                                sizeH20,
                                CircleAvatar(
                                  backgroundColor: white,
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                    imageBaseUrl +
                                        item.customer!.image.toString(),
                                  ),
                                ),
                                sizeH10,
                                Row(
                                  children: [
                                    Icon(
                                      Ionicons.person_outline,
                                      size: 15,
                                    ),
                                    sizeW10,
                                    KText(
                                      text: item.customer!.fullName.toString(),
                                    ),
                                  ],
                                ),
                                sizeH10,
                                Row(
                                  children: [
                                    Icon(
                                      Ionicons.call_outline,
                                      size: 15,
                                    ),
                                    sizeW10,
                                    KText(
                                      text:
                                          item.customer!.phoneNumber.toString(),
                                    ),
                                  ],
                                ),
                                sizeH10,
                                Row(
                                  children: [
                                    Icon(
                                      Ionicons.location_outline,
                                      size: 15,
                                    ),
                                    sizeW10,
                                    KText(
                                      text: item.customer!.address.toString(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
          }
          return Container();
        }),
      ),
    );
  }

  _defaultDialog() {
    return Get.defaultDialog(
        title: 'Book Now',
        content: Column(
          children: [
            customFormField(
              height: 45,
              hintText: 'Name',
              titleText: 'Name',
              isStarEnable: true,
              controller: nameTextC,
            ),
            sizeH10,
            customFormField(
              height: 45,
              hintText: 'Phone',
              titleText: 'Phone',
              isStarEnable: true,
              controller: phoneTextC,
            ),
            sizeH10,
            customFormField(
              height: 45,
              hintText: 'Email',
              titleText: 'Email',
              controller: emailTextC,
            ),
            sizeH10,
            customFormField(
              height: 45,
              hintText: 'Address',
              titleText: 'Address',
              isStarEnable: true,
              controller: addressTextC,
            ),
            sizeH20,
            customPrimaryButton(
              onTap: () {
                if (nameTextC.text.isEmpty ||
                    phoneTextC.text.isEmpty ||
                    addressTextC.text.isEmpty) {
                  snackBarWidget(
                    title: 'Opps!',
                    message: 'Field Empty',
                    isRed: true,
                  );
                } else {
                  applyNowC.applyNow(
                    id: widget.id,
                    name: nameTextC.text,
                    email: emailTextC.text,
                    phone: phoneTextC.text,
                    address: addressTextC.text,
                  );
                }
              },
              color: orangeO50,
              height: 45,
              title: 'Submit',
              child: Container(),
            ),
          ],
        ));
  }
}
