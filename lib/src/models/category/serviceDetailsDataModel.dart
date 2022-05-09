class ServiceDetailsDataModel {
  int? id;
  String? sellerId;
  String? scateId;
  String? ssubcateId;
  String? title;
  String? description;
  String? image;
  String? price;
  String? slug;
  int? status;
  String? createdAt;
  String? updatedAt;
  Servicecategory? servicecategory;

  ServiceDetailsDataModel(
      {this.id,
      this.sellerId,
      this.scateId,
      this.ssubcateId,
      this.title,
      this.description,
      this.image,
      this.price,
      this.slug,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.servicecategory});

  ServiceDetailsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    scateId = json['scate_id'];
    ssubcateId = json['ssubcate_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    slug = json['slug'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    servicecategory = json['servicecategory'] != null
        ? new Servicecategory.fromJson(json['servicecategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seller_id'] = this.sellerId;
    data['scate_id'] = this.scateId;
    data['ssubcate_id'] = this.ssubcateId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.servicecategory != null) {
      data['servicecategory'] = this.servicecategory!.toJson();
    }
    return data;
  }
}

class Servicecategory {
  int? id;
  String? scatename;
  String? slug;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  Servicecategory(
      {this.id,
      this.scatename,
      this.slug,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt});

  Servicecategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scatename = json['scatename'];
    slug = json['slug'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['scatename'] = this.scatename;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SellerInfo {
  int? id;
  String? shopname;
  String? slug;
  String? shoplogo;
  String? shopbanner;
  int? sellerphone;
  int? sellerphone2;
  String? selleremail;
  String? contperson;

  String? selleraddress;

  String? sellerbkashaccount;

  int? agree;
  int? verify;

  int? sellertype;
  int? area;
  int? status;
  String? createdAt;
  String? updatedAt;

  SellerInfo(
      {this.id,
      this.shopname,
      this.slug,
      this.shoplogo,
      this.shopbanner,
      this.sellerphone,
      this.sellerphone2,
      this.selleremail,
      this.contperson,
      this.selleraddress,
      this.sellerbkashaccount,
      this.agree,
      this.verify,
      this.sellertype,
      this.area,
      this.status,
      this.createdAt,
      this.updatedAt});

  SellerInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopname = json['shopname'];
    slug = json['slug'];
    shoplogo = json['shoplogo'];
    shopbanner = json['shopbanner'];
    sellerphone = json['sellerphone'];
    sellerphone2 = json['sellerphone2'];
    selleremail = json['selleremail'];
    contperson = json['contperson'];

    selleraddress = json['selleraddress'];

    sellerbkashaccount = json['sellerbkashaccount'];

    agree = json['agree'];
    verify = json['verify'];

    sellertype = json['sellertype'];
    area = json['area'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shopname'] = this.shopname;
    data['slug'] = this.slug;
    data['shoplogo'] = this.shoplogo;
    data['shopbanner'] = this.shopbanner;
    data['sellerphone'] = this.sellerphone;
    data['sellerphone2'] = this.sellerphone2;
    data['selleremail'] = this.selleremail;
    data['contperson'] = this.contperson;

    data['selleraddress'] = this.selleraddress;

    data['sellerbkashaccount'] = this.sellerbkashaccount;

    data['agree'] = this.agree;
    data['verify'] = this.verify;

    data['sellertype'] = this.sellertype;
    data['area'] = this.area;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
