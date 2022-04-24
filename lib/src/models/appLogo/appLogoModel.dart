 
class AppLogoModel {
  int? id;
  String? logo;
  String? faveicon;
  int? status;
  String? createdAt;
  String? updatedAt;

  AppLogoModel(
      {this.id,
      this.logo,
      this.faveicon,
      this.status,
      this.createdAt,
      this.updatedAt});

  AppLogoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    faveicon = json['faveicon'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo'] = this.logo;
    data['faveicon'] = this.faveicon;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
