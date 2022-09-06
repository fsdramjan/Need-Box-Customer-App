class ChatDetailsModel {
  int? id;
  String? message;
  int? customerId;
  int? sellerId;
  int? isCustomer;
  int? isSeller;
  var file;
  int? status;
  String? createdAt;
  String? updatedAt;

  ChatDetailsModel(
      {this.id,
      this.message,
      this.customerId,
      this.sellerId,
      this.isCustomer,
      this.isSeller,
      this.file,
      this.status,
      this.createdAt,
      this.updatedAt});

  ChatDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    customerId = json['customerId'];
    sellerId = json['sellerId'];
    isCustomer = json['isCustomer'];
    isSeller = json['isSeller'];
    file = json['file'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['customerId'] = this.customerId;
    data['sellerId'] = this.sellerId;
    data['isCustomer'] = this.isCustomer;
    data['isSeller'] = this.isSeller;
    data['file'] = this.file;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
