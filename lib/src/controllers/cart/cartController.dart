import 'package:get/get.dart';
import 'package:needbox_customer/src/models/cart/cartModels.dart';
import 'package:collection/collection.dart';
import '../../widgets/snackBar/customSnackbarWidget.dart';

class CartController extends GetxController {
  final cartItem = RxList<CartModels>();

  var quantityItems = RxInt(1);
  var totalQuantity = RxInt(0);

  var subTotalAmount = RxInt(0);
  var totalsAmount = RxInt(0);
  var shippingFee = RxInt(0);

  int? get cartCount => cartItem.length;
  void removeCartItem(
      {required int? id, required CartModels cartProducts}) async {
    cartItem.removeWhere((item) => item.id == id);

    quantityItems.value = quantityItems.value - cartProducts.quantity.toInt();

    subTotalAmount.value = subTotalAmount.value -
        ((cartProducts.proNewprice!.toInt()) * cartProducts.quantity.toInt());
    shippingsFee();

    totalsAmount.value = subTotalAmount.value + shippingFee.value;
    // CartHiveDBController().manageCart(item: cartProducts);
    snackBarWidget(
      title: 'Succeed',
      message: 'Cart removed',
      isRed: false,
    );
    print('delete $id');
  }

  void addItemInCart(CartModels cartProducts) {
    // cartItems.add(cartProducts);
    final index =
        cartItem.indexWhere((element) => element.id == cartProducts.id);
    if (index > -1) {
      cartItem[index] = CartModels(
        id: cartProducts.id,
        productname: cartProducts.productname,
        proNewprice: cartProducts.proNewprice,
        image: cartProducts.image,
        discount: cartProducts.discount,
        shippingfee: cartProducts.shippingfee,
        proOldprice: cartProducts.proOldprice,
        quantity: (quantityItems.value + cartItem[index].quantity.toInt()),
        productColor: cartProducts.productColor,
        stock: cartProducts.stock,
      );
      totalsAmount.value = subTotalAmount.value + shippingFee.value;
      // updateQty(cartProducts.id, cartProducts.quantity);
      // CartHiveDBController().manageCart(item: cartProducts);

      print('Update Amount : $totalsAmount');

      snackBarWidget(
        title: 'Update',
        message: 'Cart Update',
        isRed: false,
      );
    } else {
      cartItem.add(CartModels(
        id: cartProducts.id,
        productname:
            cartProducts.productname == null ? null : cartProducts.productname,
        proNewprice:
            cartProducts.proNewprice == null ? null : cartProducts.proNewprice,
        image: cartProducts.image == null ? null : cartProducts.image,
        discount: cartProducts.discount == null ? null : cartProducts.discount,
        shippingfee:
            cartProducts.shippingfee == null ? null : cartProducts.shippingfee,
        proOldprice:
            cartProducts.proOldprice == null ? null : cartProducts.proOldprice,
        quantity: quantityItems.value,
        productColor: cartProducts.productColor,
        stock: cartProducts.stock,
      ));
    }
    totalQuantity.value = totalQuantity.value + quantityItems.value;
    subTotalAmount.value = subTotalAmount.value +
        ((cartProducts.proNewprice!.toInt()) * quantityItems.value);
    shippingsFee();
    totalsAmount.value = subTotalAmount.value + shippingFee.value;
    // totalAmountInt = totalAmountInt + totalsAmount.value;
    // CartHiveDBController().manageCart(item: cartProducts);
    print('Total Amount : $totalsAmount');

    quantityItems.value = 1;
    snackBarWidget(
      title: 'Succeed',
      message: 'Cart Added',
      isRed: false,
    );
  }

  void decrementQnty() {
    if (quantityItems.value > 1) {
      quantityItems.value--;
    }
  }

  void incrementQnty() {
    quantityItems.value++;
  }

  quantityAdd(CartModels productResponse) {
    productResponse.quantity++;
    print(productResponse);
    // totalsAmount.value = subTotalAmount.value + 25;
    // addItemInCart(productResponse);
    _subTotalAmount();
    shippingsFee();

    _totalAmountGet();
    // CartHiveDBController().manageCart(item: productResponse);
  }

  quantityMinus(CartModels productResponse) {
    if (productResponse.quantity.value > 1) {
      productResponse.quantity--;
      print(productResponse);
      // addItemInCart(productResponse);
      _subTotalAmount();
      shippingsFee();

      _totalAmountGet();
      // CartHiveDBController().manageCart(item: productResponse);
    }
  }

  _subTotalAmount() {
    // var _totalAmount = RxDouble(0);

    subTotalAmount.value = cartItem.fold(
        0,
        (previous, current) =>
            previous + current.proNewprice!.toInt() * current.quantity.value);
  }

  shippingsFee() {
    shippingFee.value = subTotalAmount.value < 700
        ? 25
        : subTotalAmount.value < 1400
            ? 15
            : subTotalAmount.value < 500000
                ? 0
                : 0;
    print('shipping Fee : ${shippingFee.value}');
  }

  bool checkCartExist({required int? id}) {
    final cart = cartItem.singleWhereOrNull(
      (cart) => cart.id == id,
    );
    if (cart != null) {
      return true;
    }
    return false;
  }

  _totalAmountGet() {
    // var _totalAmount = RxDouble(0);
    for (var i = 0; i < cartItem.length; i++) {
      //
      totalsAmount.value = subTotalAmount.value + shippingFee.value;
    }
  }

  detailsPageTotalAmount() {
    // var _totalAmount = RxDouble(0);

    totalsAmount.value = cartItem.fold(
        0,
        (previous, current) =>
            previous +
            current.proNewprice!.toInt() * current.quantity.value +
            shippingFee.value);
  }

  void initQuantity() {
    quantityItems.value = 1;
  }
}
