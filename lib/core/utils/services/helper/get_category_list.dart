import 'package:ecommerce_app_admin_panel/features/category/data/models/category_model.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';

List<CategoryEntity> getCategoriesList(Map<String, dynamic> jsonData) {
  List<CategoryEntity> categoriesList = [];

  for (var category in jsonData['data']) {
    categoriesList.add(CategoryModel.fromJson(category));
  }
  return categoriesList;
}

CategoryEntity getOneCategory(Map<String, dynamic> jsonData) {
  CategoryEntity category = CategoryModel.fromJson(jsonData['data']);
  return category;
}
