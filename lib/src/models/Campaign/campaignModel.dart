class CampaignsModel {
  
  int? id;
  String? title;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  CampaignsModel(
      {this.id,
      this.title,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt});

  CampaignsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
