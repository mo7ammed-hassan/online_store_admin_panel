import 'package:dio/dio.dart';
import 'package:ecommerce_app_admin_panel/core/utils/services/helper/get_category_list.dart';

import 'package:ecommerce_app_admin_panel/core/utils/services/api_services.dart';
import 'package:ecommerce_app_admin_panel/features/category/data/models/category_model.dart';
import 'package:ecommerce_app_admin_panel/features/category/domain/entity/category_entity.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryEntity>> fetchCategories();
  Future<CategoryEntity> getCategoryById({
    required String categoryId,
  });
  Future<void> addCategory({required String name, required String imagePath});
  Future<void> updateCategory({
    required String categoryId,
    required String name,
    required String imagePath,
  });
  Future<void> deleteCategory({
    required String categoryId,
  });
}

// IMPLEMENTATION
class CategoryRemoteDataSourceImpl extends CategoryRemoteDataSource {
  // create instance of ApiService
  final ApiService _service;

  CategoryRemoteDataSourceImpl(
    this._service,
  );

  @override
  Future<List<CategoryEntity>> fetchCategories() async {
    Map<String, dynamic> jsonCategories =
        await _service.getItems(endPoint: 'categories');

    List<CategoryEntity> categories = getCategoriesList(jsonCategories);

    return categories;
  }

  @override
  Future<CategoryEntity> getCategoryById({required String categoryId}) async {
    Map<String, dynamic> category =
        await _service.getItemById(endPoint: 'categories', itemId: categoryId);

    CategoryEntity categoryItem = getOneCategory(category);

    return categoryItem;
  }

  @override
  Future<CategoryEntity> addCategory({
    required String name,
    required imagePath,
  }) async {
    final categoryData = await _service.addItem(
      endPoint: 'categories',
      itemData: FormData.fromMap(
        {
          'name': name,
          'img': await MultipartFile.fromFile(imagePath),
        },
      ),
    );
    return CategoryModel.fromJson(categoryData['data']);
  }

  @override
  Future<CategoryEntity> updateCategory({
    required String categoryId,
    required String name,
    required String imagePath,
  }) async {
    final formData = FormData.fromMap({
      'name': name,
      'img': await MultipartFile.fromFile(imagePath),
    });

    final categoryUpdated = await _service.updateItem(
      endPoint: 'categories',
      itemId: categoryId,
      itemData: formData,
    );
    return CategoryModel.fromJson(categoryUpdated['data']);
  }

  @override
  Future<void> deleteCategory({required String categoryId}) async {
    await _service.deleteItem(endPoint: 'categories', itemId: categoryId);
  }
}
