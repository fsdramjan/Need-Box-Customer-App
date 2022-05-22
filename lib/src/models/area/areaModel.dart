class AreaModel {
  int? id;
  int? districtId;
  String? area;
  int? shippingfee;
  int? status;
  String? createdAt;
  String? updatedAt;

  AreaModel(
      {this.id,
      this.districtId,
      this.area,
      this.shippingfee,
      this.status,
      this.createdAt,
      this.updatedAt});

  AreaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    districtId = json['district_id'];
    area = json['area'];
    shippingfee = json['shippingfee'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['district_id'] = this.districtId;
    data['area'] = this.area;
    data['shippingfee'] = this.shippingfee;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
