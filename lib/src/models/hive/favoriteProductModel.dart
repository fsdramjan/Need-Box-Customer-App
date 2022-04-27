import 'package:hive/hive.dart';
part 'favoriteProductModel.g.dart';

@HiveType(typeId: 0)
class FavoriteProductModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? productname;
  @HiveField(2)
  String? image;
  @HiveField(3)
  String? productColor;
  @HiveField(4)
  int? proPrice;
  @HiveField(5)
  int? proDisPrice;
  @HiveField(6)
  int? discount;

  FavoriteProductModel({
    this.id,
    this.productname,
    this.image,
    this.proDisPrice,
    this.proPrice,
    this.productColor,
    this.discount,
  });
}
