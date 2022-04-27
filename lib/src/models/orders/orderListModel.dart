class OrderListModel {
  int? orderIdPrimary;
  int? customerId;
  String? ordertrack;
  int? orderTotal;
  int? cshippingfee;

  int? additionalshipping;
  int? shippingId;
  int? orderSubtotal;
  int? totalproductpoint;
  String? orderStatus;

 

  OrderListModel(
      {this.orderIdPrimary,
      this.customerId,
      this.ordertrack,
      this.orderTotal,
      this.cshippingfee,
      this.additionalshipping,
      this.shippingId,
      this.orderSubtotal,
      this.totalproductpoint,
      this.orderStatus,
  });

  OrderListModel.fromJson(Map<String, dynamic> json) {
    orderIdPrimary = json['orderIdPrimary'];
    customerId = json['customerId'];
    ordertrack = json['ordertrack'];
    orderTotal = json['orderTotal'];
    cshippingfee = json['cshippingfee'];

    additionalshipping = json['additionalshipping'];
    shippingId = json['shippingId'];
    orderSubtotal = json['orderSubtotal'];
    totalproductpoint = json['totalproductpoint'];
    orderStatus = json['orderStatus'];

   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderIdPrimary'] = this.orderIdPrimary;
    data['customerId'] = this.customerId;
    data['ordertrack'] = this.ordertrack;
    data['orderTotal'] = this.orderTotal;
    data['cshippingfee'] = this.cshippingfee;

    data['additionalshipping'] = this.additionalshipping;
    data['shippingId'] = this.shippingId;
    data['orderSubtotal'] = this.orderSubtotal;
    data['totalproductpoint'] = this.totalproductpoint;
    data['orderStatus'] = this.orderStatus;
 
    return data;
  }
}
