
class ProductDetailsModel {
  Productdetails? productdetails;
  Relatedproduct? relatedproduct;
  Sellerinfo? sellerinfo;
  Productbrand? productbrand;

  ProductDetailsModel({
    this.productdetails,
    this.relatedproduct,
    this.sellerinfo,
    this.productbrand,
  });

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    productdetails = json['productdetails'] != null
        ? new Productdetails.fromJson(json['productdetails'])
        : null;
    relatedproduct = json['relatedproduct'] != null
        ? new Relatedproduct.fromJson(json['relatedproduct'])
        : null;
    sellerinfo = json['sellerinfo'] != null
        ? new Sellerinfo.fromJson(json['sellerinfo'])
        : null;
    productbrand = json['productbrand'] != null
        ? new Productbrand.fromJson(json['productbrand'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productdetails != null) {
      data['productdetails'] = this.productdetails!.toJson();
    }
    if (this.relatedproduct != null) {
      data['relatedproduct'] = this.relatedproduct!.toJson();
    }
    if (this.sellerinfo != null) {
      data['sellerinfo'] = this.sellerinfo!.toJson();
    }
    if (this.productbrand != null) {
      data['productbrand'] = this.productbrand!.toJson();
    }

    return data;
  }
}

class Productdetails {
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
  List<Colors>? colors;
  List<Null>? sizes;

  Productdetails(
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
      this.proImage,
      this.colors,
      this.sizes});

  Productdetails.fromJson(Map<String, dynamic> json) {
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
    if (json['colors'] != null) {
      colors = <Colors>[];
      json['colors'].forEach((v) {
        colors!.add(new Colors.fromJson(v));
      });
    }
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
    if (this.colors != null) {
      data['colors'] = this.colors!.map((v) => v.toJson()).toList();
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

class Colors {
  int? id;
  String? colorName;
  String? color;
  String? slug;
  String? status;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Colors(
      {this.id,
      this.colorName,
      this.color,
      this.slug,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Colors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    colorName = json['colorName'];
    color = json['color'];
    slug = json['slug'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['colorName'] = this.colorName;
    data['color'] = this.color;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? productId;
  int? colorId;
  String? createdAt;
  String? updatedAt;

  Pivot({this.productId, this.colorId, this.createdAt, this.updatedAt});

  Pivot.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    colorId = json['color_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['color_id'] = this.colorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Relatedproduct {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;

  String? path;
  int? perPage;

  int? to;
  int? total;

  Relatedproduct(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Relatedproduct.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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

class Sellerinfo {
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

  Sellerinfo(
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
      this.agree,
      this.verify,
      this.sellertype,
      this.status,
      this.createdAt,
      this.updatedAt});

  Sellerinfo.fromJson(Map<String, dynamic> json) {
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

class Productbrand {
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
  String? brandName;

  Productbrand(
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
      this.brandName});

  Productbrand.fromJson(Map<String, dynamic> json) {
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
    brandName = json['brandName'];
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
    data['brandName'] = this.brandName;
    return data;
  }
}
