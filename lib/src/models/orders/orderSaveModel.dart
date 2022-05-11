class OrderSaveModel {
  List<CartItem>? cart;
  String? name;
  String? phone;
  String? district;
  String? area;
  String? stateaddress;
  String? houseaddress;
  String? fulladdress;
  String? zipcode;
  String? totalprice;
  String? shippingfee;
  String? discount;
  String? additionalshipping;
  String? couponcode;
  String? totalproductpoint;
  String? usemypoint;
  String? paymentType;

  OrderSaveModel(
      {this.cart,
      this.name,
      this.phone,
      this.district,
      this.area,
      this.stateaddress,
      this.houseaddress,
      this.fulladdress,
      this.zipcode,
      this.totalprice,
      this.shippingfee,
      this.discount,
      this.additionalshipping,
      this.couponcode,
      this.totalproductpoint,
      this.usemypoint,
      this.paymentType});

  OrderSaveModel.fromJson(Map<String, dynamic> json) {
    if (json['cart'] != null) {
      cart = <CartItem>[];
      json['cart'].forEach((v) {
        cart!.add(new CartItem.fromJson(v));
      });
    }
    name = json['name'];
    phone = json['phone'];
    district = json['district'];
    area = json['area'];
    stateaddress = json['stateaddress'];
    houseaddress = json['houseaddress'];
    fulladdress = json['fulladdress'];
    zipcode = json['zipcode'];
    totalprice = json['totalprice'];
    shippingfee = json['shippingfee'];
    discount = json['discount'];
    additionalshipping = json['additionalshipping'];
    couponcode = json['couponcode'];
    totalproductpoint = json['totalproductpoint'];
    usemypoint = json['usemypoint'];
    paymentType = json['paymentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cart != null) {
      data['cart'] = this.cart!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['district'] = this.district;
    data['area'] = this.area;
    data['stateaddress'] = this.stateaddress;
    data['houseaddress'] = this.houseaddress;
    data['fulladdress'] = this.fulladdress;
    data['zipcode'] = this.zipcode;
    data['totalprice'] = this.totalprice;
    data['shippingfee'] = this.shippingfee;
    data['discount'] = this.discount;
    data['additionalshipping'] = this.additionalshipping;
    data['couponcode'] = this.couponcode;
    data['totalproductpoint'] = this.totalproductpoint;
    data['usemypoint'] = this.usemypoint;
    data['paymentType'] = this.paymentType;
    return data;
  }
}

class CartItem {
  int? productId;
  String? productName;
  int? sellerid;
  int? productPrice;
  int? quantity;
  String? productSize;
  String? productColor;

  CartItem(
      {this.productId,
      this.productName,
      this.sellerid,
      this.productPrice,
      this.quantity,
      this.productSize,
      this.productColor});

  CartItem.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    sellerid = json['sellerid'];
    productPrice = json['product_price'];
    quantity = json['quantity'];
    productSize = json['product_size'];
    productColor = json['product_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['sellerid'] = this.sellerid;
    data['product_price'] = this.productPrice;
    data['quantity'] = this.quantity;
    data['product_size'] = this.productSize;
    data['product_color'] = this.productColor;
    return data;
  }
}
