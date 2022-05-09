class ServiceCategoryDataModel {
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

  ServiceCategoryDataModel(
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
      this.updatedAt});

  ServiceCategoryDataModel.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
