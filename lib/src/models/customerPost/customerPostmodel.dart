class CustomerPostModel {
  int? id;
  int? customerId;
  String? title;
  String? image;
  String? description;
  String? slug;
  String? request;
  int? status;
  String? createdAt;
  String? updatedAt;
  Customer? customer;

  CustomerPostModel(
      {this.id,
      this.customerId,
      this.title,
      this.image,
      this.description,
      this.slug,
      this.request,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.customer});

  CustomerPostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    slug = json['slug'];
    request = json['request'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['slug'] = this.slug;
    data['request'] = this.request;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Customer {
  int? id;
  String? referralId;
  String? fullName;
  String? phoneNumber;
  String? address;
  String? email;
  // Null? passResetToken;
  String? verifyToken;
  int? mypoint;
  String? image;
  // Null? provider;
  // Null? providerId;
  int? status;
  String? createdAt;
  String? updatedAt;

  Customer(
      {this.id,
      this.referralId,
      this.fullName,
      this.phoneNumber,
      this.address,
      this.email,
      // this.passResetToken,
      this.verifyToken,
      this.mypoint,
      this.image,
      // this.provider,
      // this.providerId,
      this.status,
      this.createdAt,
      this.updatedAt});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referralId = json['referralId'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    email = json['email'];
    // passResetToken = json['passResetToken'];
    verifyToken = json['verifyToken'];
    mypoint = json['mypoint'];
    image = json['image'];
    // provider = json['provider'];
    // providerId = json['provider_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['referralId'] = this.referralId;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['email'] = this.email;
    // data['passResetToken'] = this.passResetToken;
    data['verifyToken'] = this.verifyToken;
    data['mypoint'] = this.mypoint;
    data['image'] = this.image;
    // data['provider'] = this.provider;
    // data['provider_id'] = this.providerId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
