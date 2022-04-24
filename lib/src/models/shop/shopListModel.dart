class ShopListModel {
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
  int? status;
  String? createdAt;
  String? updatedAt;

  ShopListModel(
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
      this.status,
      this.createdAt,
      this.updatedAt});

  ShopListModel.fromJson(Map<String, dynamic> json) {
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
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
