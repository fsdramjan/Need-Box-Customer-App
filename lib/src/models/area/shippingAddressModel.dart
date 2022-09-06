class ShippingAddressModel {
  int? id;
  String? name;
  String? phone;
  District? district;
  Area? area;
  String? stateaddress;
  String? customerid;
  String? houseaddress;
  String? fulladdress;
  String? zipcode;
  String? createdAt;
  String? updatedAt;

  ShippingAddressModel(
      {this.id,
      this.name,
      this.phone,
      this.district,
      this.area,
      this.stateaddress,
      this.customerid,
      this.houseaddress,
      this.fulladdress,
      this.zipcode,
      this.createdAt,
      this.updatedAt});

  ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
    stateaddress = json['stateaddress'];
    customerid = json['customerid'];
    houseaddress = json['houseaddress'];
    fulladdress = json['fulladdress'];
    zipcode = json['zipcode'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    data['stateaddress'] = this.stateaddress;
    data['customerid'] = this.customerid;
    data['houseaddress'] = this.houseaddress;
    data['fulladdress'] = this.fulladdress;
    data['zipcode'] = this.zipcode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class District {
  int? id;
  String? name;
  int? status;
  String? createdAt;
  String? updatedAt;

  District({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Area {
  int? id;
  int? districtId;
  String? area;
  int? shippingfee;
  int? status;
  String? createdAt;
  String? updatedAt;

  Area(
      {this.id,
      this.districtId,
      this.area,
      this.shippingfee,
      this.status,
      this.createdAt,
      this.updatedAt});

  Area.fromJson(Map<String, dynamic> json) {
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
