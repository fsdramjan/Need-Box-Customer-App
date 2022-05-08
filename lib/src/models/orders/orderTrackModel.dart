class OrderTrackModel {
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
  int? deliverymanId;
  int? agentId;
  String? createdAt;
  String? updatedAt;
  Status? status;

  OrderTrackModel(
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
      this.deliverymanId,
      this.agentId,
      this.createdAt,
      this.updatedAt,
      this.status});

  OrderTrackModel.fromJson(Map<String, dynamic> json) {
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
    deliverymanId = json['deliveryman_id'];
    agentId = json['agent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
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
    data['deliveryman_id'] = this.deliverymanId;
    data['agent_id'] = this.agentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    return data;
  }
}

class Status {
  int? id;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;

  Status({this.id, this.name, this.slug, this.createdAt, this.updatedAt});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
