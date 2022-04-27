 

class CategoryListModel {
  int? id;
  String? catname;
  String? slug;
  String? image;
  int? level;
  int? frontPage;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<Subcategories>? subcategories;

  CategoryListModel(
      {this.id,
      this.catname,
      this.slug,
      this.image,
      this.level,
      this.frontPage,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.subcategories});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catname = json['catname'];
    slug = json['slug'];
    image = json['image'];
    level = json['level'];
    frontPage = json['frontPage'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(new Subcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['catname'] = this.catname;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['level'] = this.level;
    data['frontPage'] = this.frontPage;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.subcategories != null) {
      data['subcategories'] =
          this.subcategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategories {
  int? id;
  String? subcategoryName;
  String? slug;
  int? categoryId;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<Childcategories>? childcategories;

  Subcategories(
      {this.id,
      this.subcategoryName,
      this.slug,
      this.categoryId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.childcategories,});

  Subcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subcategoryName = json['subcategoryName'];
    slug = json['slug'];
    categoryId = json['category_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['childcategories'] != null) {
      childcategories = <Childcategories>[];
      json['childcategories'].forEach((v) {
        childcategories!.add(new Childcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subcategoryName'] = this.subcategoryName;
    data['slug'] = this.slug;
    data['category_id'] = this.categoryId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.childcategories != null) {
      data['childcategories'] =
          this.childcategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Childcategories {
  int? id;
  String? childcategoryName;
  String? slug;
  int? subcategoryId;
  int? status;
  String? createdAt;
  String? updatedAt;

  Childcategories(
      {this.id,
      this.childcategoryName,
      this.slug,
      this.subcategoryId,
      this.status,
      this.createdAt,
      this.updatedAt});

  Childcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    childcategoryName = json['childcategoryName'];
    slug = json['slug'];
    subcategoryId = json['subcategory_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['childcategoryName'] = this.childcategoryName;
    data['slug'] = this.slug;
    data['subcategory_id'] = this.subcategoryId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
