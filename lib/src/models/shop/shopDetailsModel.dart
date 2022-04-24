 

class ShopDetailsModel {
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

  ShopDetailsModel(
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

  ShopDetailsModel.fromJson(Map<String, dynamic> json) {
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

 
class Products {
  int? id;
  int? productcat;
  int? productsubcat;
  int? productchildcat;
  int? productbrand;
  int? campaignId;
  String? productname;
  String? slug;
  int? productdiscount;
  int? productnewprice;
  int? productoldprice;
  int? productpoint;
  String? productcode;
 
  String? productdetails;
  String? productdetails2;
  int? productquantity;
  int? sellerid;
  int? producttype;
  int? request;
  int? status;
  String? createdAt;
  String? updatedAt;
  ProImage? proImage;

  Products(
      {this.id,
      this.productcat,
      this.productsubcat,
      this.productchildcat,
      this.productbrand,
      this.campaignId,
      this.productname,
      this.slug,
      this.productdiscount,
      this.productnewprice,
      this.productoldprice,
      this.productpoint,
      this.productcode,
 
      this.productdetails,
      this.productdetails2,
      this.productquantity,
      this.sellerid,
      this.producttype,
      this.request,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.proImage});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productcat = json['productcat'];
    productsubcat = json['productsubcat'];
    productchildcat = json['productchildcat'];
    productbrand = json['productbrand'];
    campaignId = json['campaign_id'];
    productname = json['productname'];
    slug = json['slug'];
    productdiscount = json['productdiscount'];
    productnewprice = json['productnewprice'];
    productoldprice = json['productoldprice'];
    productpoint = json['productpoint'];
    productcode = json['productcode'];
 
    productdetails = json['productdetails'];
    productdetails2 = json['productdetails2'];
    productquantity = json['productquantity'];
    sellerid = json['sellerid'];
    producttype = json['producttype'];
    request = json['request'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    proImage = json['pro_image'] != null
        ? new ProImage.fromJson(json['pro_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productcat'] = this.productcat;
    data['productsubcat'] = this.productsubcat;
    data['productchildcat'] = this.productchildcat;
    data['productbrand'] = this.productbrand;
    data['campaign_id'] = this.campaignId;
    data['productname'] = this.productname;
    data['slug'] = this.slug;
    data['productdiscount'] = this.productdiscount;
    data['productnewprice'] = this.productnewprice;
    data['productoldprice'] = this.productoldprice;
    data['productpoint'] = this.productpoint;
    data['productcode'] = this.productcode;
 
    data['productdetails'] = this.productdetails;
    data['productdetails2'] = this.productdetails2;
    data['productquantity'] = this.productquantity;
    data['sellerid'] = this.sellerid;
    data['producttype'] = this.producttype;
    data['request'] = this.request;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.proImage != null) {
      data['pro_image'] = this.proImage!.toJson();
    }
    return data;
  }
}

class ProImage {
  int? id;
  int? productId;
  String? image;
  String? createdAt;
  String? updatedAt;

  ProImage(
      {this.id, this.productId, this.image, this.createdAt, this.updatedAt});

  ProImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
