class WholeSaleProductModel {
  int? id;
  int? productcat;
  int? productsubcat;
  int? productchildcat;
  var productbrand;
  var campaignId;
  String? productname;
  String? slug;
  var productdiscount;
  int? productnewprice;
  var productoldprice;
  var productpoint;
  String? productcode;
  int? additionalshipping;
  var featureproductdate;
  var productstyle;
  String? productdetails;
  String? productdetails2;
  int? productquantity;
  int? sellerid;
  int? producttype;
  int? featured;
  int? request;
  int? status;
  String? createdAt;
  String? updatedAt;
  Productprice? productprice;
  List<Productprice>? productprices;
  ProImage? proImage;

  WholeSaleProductModel(
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
      this.additionalshipping,
      this.featureproductdate,
      this.productstyle,
      this.productdetails,
      this.productdetails2,
      this.productquantity,
      this.sellerid,
      this.producttype,
      this.featured,
      this.request,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.productprice,
      this.productprices,
      this.proImage});

  WholeSaleProductModel.fromJson(Map<String, dynamic> json) {
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
    additionalshipping = json['additionalshipping'];
    featureproductdate = json['featureproductdate'];
    productstyle = json['productstyle'];
    productdetails = json['productdetails'];
    productdetails2 = json['productdetails2'];
    productquantity = json['productquantity'];
    sellerid = json['sellerid'];
    producttype = json['producttype'];
    featured = json['featured'];
    request = json['request'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productprice = json['productprice'] != null
        ? new Productprice.fromJson(json['productprice'])
        : null;
    if (json['productprices'] != null) {
      productprices = <Productprice>[];
      json['productprices'].forEach((v) {
        productprices!.add(new Productprice.fromJson(v));
      });
    }
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
    data['additionalshipping'] = this.additionalshipping;
    data['featureproductdate'] = this.featureproductdate;
    data['productstyle'] = this.productstyle;
    data['productdetails'] = this.productdetails;
    data['productdetails2'] = this.productdetails2;
    data['productquantity'] = this.productquantity;
    data['sellerid'] = this.sellerid;
    data['producttype'] = this.producttype;
    data['featured'] = this.featured;
    data['request'] = this.request;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.productprice != null) {
      data['productprice'] = this.productprice!.toJson();
    }
    if (this.productprices != null) {
      data['productprices'] =
          this.productprices!.map((v) => v.toJson()).toList();
    }
    if (this.proImage != null) {
      data['pro_image'] = this.proImage!.toJson();
    }
    return data;
  }
}

class Productprice {
  int? id;
  int? productId;
  int? minQty;
  int? maxQty;
  int? price;
  String? createdAt;
  String? updatedAt;

  Productprice(
      {this.id,
      this.productId,
      this.minQty,
      this.maxQty,
      this.price,
      this.createdAt,
      this.updatedAt});

  Productprice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    minQty = json['min_qty'];
    maxQty = json['max_qty'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['min_qty'] = this.minQty;
    data['max_qty'] = this.maxQty;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
