import 'package:shop_user/constants/assets.dart';
import 'package:shop_user/models/categories_model.dart';

class AppConstants {
  static const String productImageUrl =
      'https://th.bing.com/th/id/R.77eed415b01a3ec4f6cb7758a5a2a6d4?rik=XKDGn49n844u4Q&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fshoes-png-nike-shoes-transparent-background-800.png&ehk=ZvKLgGJIAl%2fJYtcu4emEZimity8VBQnk3UNcaW8MbLQ%3d&risl=&pid=ImgRaw&r=0';
  static const List<String> bannarsImages = [
    Assets.imagesBannersBanner1,
    Assets.imagesBannersBanner2
  ];

  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
      image: Assets.imagesCategoriesMobiles,
      name: 'Phones',
      id: 'phones',
    ),
    CategoriesModel(
      image: Assets.imagesCategoriesElectronics,
      name: 'Electronics',
      id: 'electronics',
    ),
    CategoriesModel(
      image: Assets.imagesCategoriesBookImg,
      name: 'Books',
      id: 'books',
    ),
    CategoriesModel(
      image: Assets.imagesCategoriesCosmetics,
      name: 'Cosmetics',
      id: 'cosmetics',
    ),
    CategoriesModel(
      image: Assets.imagesCategoriesFashion,
      name: 'Clothes',
      id: 'clothes',
    ),
    CategoriesModel(
      image: Assets.imagesCategoriesPc,
      name: 'Laptops',
      id: 'laptops',
    ),
    CategoriesModel(
      image: Assets.imagesCategoriesShoes,
      name: 'Shoes',
      id: 'shoes',
    ),
    CategoriesModel(
      image: Assets.imagesCategoriesWatch,
      name: 'Watches',
      id: 'watches',
    ),
  ];
}
