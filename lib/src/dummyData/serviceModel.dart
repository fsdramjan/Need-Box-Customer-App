final serviceList = [
  ServiceModel(
    image:
        'https://needboxbd.xyz/public/uploads/servicecategory/1642589675-category1.png',
    title: 'Ac Servecing',
    onTap: () {},
  ),
  ServiceModel(
    image:
        'https://needboxbd.xyz/public/uploads/servicecategory/1642589832-category2.jpg',
    title: 'Rent a car',
    onTap: () {},
  ),
  ServiceModel(
    image:
        'https://needboxbd.xyz/public/uploads/servicecategory/1642590180-category3.jpg',
    title: 'Cleaning',
    onTap: () {},
  ),
  ServiceModel(
    image:
        'https://needboxbd.xyz/public/uploads/servicecategory/1642590196-category4.webp',
    title: 'IT Services',
    onTap: () {},
  ),
];

class ServiceModel {
  String? title;
  String? image;
  void Function()? onTap;

  ServiceModel({
    required this.image,
    required this.title,
    required this.onTap,
  });
}
