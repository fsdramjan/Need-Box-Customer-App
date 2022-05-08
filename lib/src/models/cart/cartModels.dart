import 'package:get/get.dart';

class CartModels {
  int? id;
  String? productname;
  int? proNewprice;
  int? proOldprice;
  int? stock;
  String? image;
  String? productColor;
  int? discount;
  String? shippingfee;

  CartModels({
    required this.id,
    required this.image,
    required this.productColor,
    required this.productname,
    required this.proNewprice,
    required this.proOldprice,
    required this.discount,
    required this.shippingfee,
    required this.stock,
    int quantity = 1,
    bool isAlreadyExistCart = false,
  }) {
    this.setQuantity(quantity);
    this.setIscartExist(isAlreadyExistCart);
  }
  RxInt quantity = RxInt(1);
  setQuantity(int value) => quantity.value = value;

  RxBool isAlreadyExistCart = RxBool(false);
  setIscartExist(bool value) => isAlreadyExistCart.value = value;
 
}
