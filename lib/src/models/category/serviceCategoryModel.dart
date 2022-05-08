class ServiceCategoryModel {
  int? id;
  String? scatename;
  String? slug;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  ServiceCategoryModel(
      {this.id,
      this.scatename,
      this.slug,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt});

  ServiceCategoryModel.fromJson(Map<String, dynamic> json) {
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
