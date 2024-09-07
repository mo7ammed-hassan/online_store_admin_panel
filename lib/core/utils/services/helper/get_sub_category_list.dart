import 'package:ecommerce_app_admin_panel/features/sub_category/data/models/sub_category_data.dart';
import 'package:ecommerce_app_admin_panel/features/sub_category/domain/entites/sub_category_entity.dart';

List<SubCategoryEntity> getSubCategoriesList(Map<String, dynamic> jsonData) {
  List<SubCategoryEntity> subCategoriesList = [];
  for (var subCategory in jsonData['data']) {
    subCategoriesList.add(Data.fromJson(subCategory));
  }
  return subCategoriesList;
}

SubCategoryEntity getSingleSubCatregory(Map<String, dynamic> jsonData) {
  SubCategoryEntity subCategory = Data.fromJson(jsonData['data']);
  return subCategory;
}
