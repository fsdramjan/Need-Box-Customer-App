class UserProfileDetailsModel {
  int? id;
  String? fullName;
  String? phoneNumber;
  String? address;
  String? email;
  String? verifyToken;
  int? mypoint;
  String? image;
  String? createdAt;
  String? updatedAt;

  UserProfileDetailsModel({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.address,
    this.email,
    this.verifyToken,
    this.mypoint,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  UserProfileDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    email = json['email'];
    verifyToken = json['verifyToken'];
    mypoint = json['mypoint'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['email'] = this.email;
    data['verifyToken'] = this.verifyToken;
    data['mypoint'] = this.mypoint;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
