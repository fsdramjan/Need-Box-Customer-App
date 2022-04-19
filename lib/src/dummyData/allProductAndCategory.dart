final allProductAndCategoryList = [
  AllProductAndCategory(
    productName: 'Japani Silk Sharee - Deep Jam',
    productImage:
        'https://needboxbd.xyz/public/uploads/product/4-1612607743-Block%20Printed%20Cotton%20Unstitched%20Three%20Piece%20For%20Women.jpg',
    productDes: '''Product Type: Sharee
Color: Deep Majenta
Main Material: Silk
12 Haat Bohor
Perfect wear for formal occasions''',
    productPrice: '1599',
    productDisPrice: '1190',
    productDiscount: '26',
    categoryName: 'Electronic Accessories',
    categoryImage:
        'https://needboxbd.xyz/public/uploads/category/1598525995-eaccessories.png',
  ),
  AllProductAndCategory(
    productName: 'Jhum Tower Sarees For Women Blue Tanjin Tisha',
    productImage:
        'https://needboxbd.xyz/public/uploads/product/2-1613995547-saree2.jpg',
    productDes: '''Product Type: Soft Zoom Cotton Saree
Original Monipuri joom saree
Gender: Women
Occasion: Casual, Party & Festive wear
Saree Style: Regular wear Saree
hand wash
Size-13 Haat
Very comfortable to use in any weather
Colour Garanty''',
    productPrice: '1250',
    productDisPrice: '999',
    productDiscount: '20',
    categoryName: 'TV & Home Appliances',
    categoryImage:
        'https://needboxbd.xyz/public/uploads/category/1598526026-eappliances.png',
  ),
  AllProductAndCategory(
    productName:
        'Multicolor Cotton Tangail Tat Chumki Saree For Women Without Blouse Piece',
    productImage:
        'https://needboxbd.xyz/public/uploads/product/3-1613995426-saree1.jpg',
    productDes: '''Length : 13.5ft
Made From : Tangail Tant
Made By : Handloom
Perfect wear for formal occasions
Colour : Multicoloured
Saree without Matching Blouse Piece
Material : Cotton''',
    productPrice: '1200',
    productDisPrice: '899',
    productDiscount: '25',
    categoryName: 'Health & Beauty',
    categoryImage:
        'https://needboxbd.xyz/public/uploads/category/1598527450-health.png',
  ),
];

class AllProductAndCategory {
  final String productName;
  final String productImage;
  final String productDes;
  final String productPrice;
  final String productDisPrice;
  final String productDiscount;
  final String categoryName;
  final String categoryImage;

  AllProductAndCategory({
    required this.productName,
    required this.productImage,
    required this.productDes,
    required this.productPrice,
    required this.productDisPrice,
    required this.productDiscount,
    required this.categoryName,
    required this.categoryImage,
  });
}
