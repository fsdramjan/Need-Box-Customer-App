  
class ServiceSubCategoryModel {
  int? id;
  String? scateid;
  String? ssubcatename;
  String? slug;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  ServiceSubCategoryModel(
      {this.id,
      this.scateid,
      this.ssubcatename,
      this.slug,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt});

  ServiceSubCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scateid = json['scateid'];
    ssubcatename = json['ssubcatename'];
    slug = json['slug'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['scateid'] = this.scateid;
    data['ssubcatename'] = this.ssubcatename;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
} 