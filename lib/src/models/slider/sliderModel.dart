class SliderModel {
  int? id;
  String? image;
  String? link;
  int? status;
  String? createdAt;
  String? updatedAt;

  SliderModel(
      {this.id,
      this.image,
      this.link,
      this.status,
      this.createdAt,
      this.updatedAt});

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    link = json['link'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['link'] = this.link;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
